// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
//
// Created by Luc Dion on 2017-08-23.

import UIKit

class RayWenderlichTutorialViewController: BaseViewController {
    fileprivate var mainView: RayWenderlichTutorialView {
        return self.view as! RayWenderlichTutorialView
    }

    init(pageType: PageType) {
        super.init()
        title = pageType.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        let shows = loadShows()
        let series = Series(shows: shows)
        view = RayWenderlichTutorialView(series: series)
    }
    
    fileprivate func loadShows() -> [Show] {
        guard let path = Bundle.main.path(forResource: "Shows", ofType: "plist"),
              let dictArray = NSArray(contentsOfFile: path) as? [[String: AnyObject]] else {
            return []
        }
        
        var shows: [Show] = []
        
        dictArray.forEach { (dict) in
            guard
                let title = dict["title"] as? String,
                let length = dict["length"] as? String,
                let detail = dict["detail"] as? String,
                let image = dict["image"] as? String
                else {
                    fatalError("Error parsing dict \(dict)")
            }
            
            let show = Show(title: title, length: length, detail: detail, image: image)
            shows.append(show)
        }
        
        return shows
    }
}
