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

import UIKit

enum PageType: Int {
    case intro
    case rayWenderlich
    case tableview
    case yogaExampleA
    case yogaExampleB
    case yogaExampleC
    case yogaExampleD
    case yogaExampleE
    //case flex
    
    case count
    
    var text: String {
        switch self {
        case .intro:          return "Intro Example"
        case .rayWenderlich:  return "Raywenderlich Tutorial"
        case .tableview:      return "UITableView with variable cell's height"
        case .yogaExampleA:   return "Yoga C Example"
        case .yogaExampleB:   return "Yoga Obj-C Example"
        case .yogaExampleC:   return "Yoga Java Example"
        case .yogaExampleD:   return "Yoga C# Example"
        case .yogaExampleE:   return "Yoga Android Example"
        //case .flex:           return "Flexbox"
        case .count:          return ""
        }
    }

    var viewController: UIViewController {
        switch self {
        case .intro:          return IntroViewController(pageType: self)
        case .rayWenderlich:  return RayWenderlichTutorialViewController(pageType: self)
        case .tableview:      return TableViewExampleViewController(pageType: self)
        case .yogaExampleA:   return YogaExampleAViewController(pageType: self)
        case .yogaExampleB:   return YogaExampleBViewController(pageType: self)
        case .yogaExampleC:   return YogaExampleCViewController(pageType: self)
        case .yogaExampleD:   return YogaExampleDViewController(pageType: self)
        case .yogaExampleE:   return YogaExampleEViewController(pageType: self)
        //case .flex:           return FlexboxViewController(pageType: self)
        case .count:          return UIViewController()
        }
    }
}

class MenuViewController: BaseViewController {
    fileprivate var mainView: MenuView {
        return self.view as! MenuView
    }

    override init() {
        super.init()
        title = "FlexLayout Examples"
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = MenuView()
        mainView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        didSelect(pageType: .yogaExampleE)
    }
}

// MARK: MenuViewDelegate
extension MenuViewController: MenuViewDelegate {
    func didSelect(pageType: PageType) {
        navigationController?.pushViewController(pageType.viewController, animated: true)
    }
}
