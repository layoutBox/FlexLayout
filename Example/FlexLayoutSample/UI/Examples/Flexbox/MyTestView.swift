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

import Foundation
import UIKit
import FlexLayout
import PinLayout

class MyTestView: BaseView {
    
    fileprivate let rootFlexContainer = UIView()

    override init() {
        super.init()
        
        backgroundColor = UIColor(red: 0.90, green: 0.97, blue: 0.98, alpha: 1.00)
        
        initCenteredButtons()
        
        rootFlexContainer.layer.borderWidth = 2
        rootFlexContainer.layer.borderColor = UIColor(red: 0.52, green: 0.53, blue: 0.55, alpha: 1.00).cgColor
        addSubview(rootFlexContainer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initCenteredButtons() {
        let view1 = BasicView(text: "View 1")
        let view2 = BasicView(text: "View 2")
        let view3 = BasicView(text: "View 3")
        
        rootFlexContainer.flex.justifyContent(.center).padding(10).define { (flex) in
            flex.addItem(view1).height(40)
            flex.addItem(view2).height(40).marginTop(10)
            flex.addItem(view3).height(40).marginTop(10)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        rootFlexContainer.pin.top(topLayoutGuide).width(300).height(400)
//        rootFlexContainer.pin.top(topLayoutGuide).bottom().width(100%)
        rootFlexContainer.flex.layout()
    }
}
