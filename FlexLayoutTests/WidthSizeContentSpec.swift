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

import Quick
import Nimble

class WidthSizeContentSpec: QuickSpec {
    override func spec() {
        var viewController: UIViewController!
        var rootFlexContainer: UIView!
        var aView: UIView!
        var bView: UIView!
        var cView: UIView!
        var dView: UIView!

        beforeSuite {
        }
        
        beforeEach {
            viewController = UIViewController()
            
            rootFlexContainer = UIView()
            rootFlexContainer.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            viewController.view.addSubview(rootFlexContainer)
            
            aView = UIView()
            bView = UIView()
            cView = UIView()
            dView = UIView()
        }
        
        describe("basis") {
            it("adjust view position") {
                rootFlexContainer.flex.define { (flex) in
                    flex.addItem(aView).width(100).height(200)
                }
                rootFlexContainer.flex.layout()
                expect(aView.frame).to(equal(CGRect(x: 0.0, y: 0.0, width: 100.0, height: 200.0)))
            }
            
            it("aspectRatio") {
                rootFlexContainer.flex.define { (flex) in
                    flex.addItem(aView).width(200).aspectRatio(2)
                }
                
                rootFlexContainer.flex.layout()
                expect(aView.frame).to(equal(CGRect(x: 0.0, y: 0.0, width: 200.0, height: 100.0)))
            }
            
            it("aspectRatio") {
                rootFlexContainer.flex.define { (flex) in
                    flex.addItem(aView).width(200).aspectRatio(2)
                }
                
                // Later reset the aspectRatio
                aView.flex.aspectRatio(nil)
                rootFlexContainer.flex.layout()
                expect(aView.frame).to(equal(CGRect(x: 0.0, y: 0.0, width: 200.0, height: 0.0)))
            }
            
            it("minWidth") {
                rootFlexContainer.flex.define { (flex) in
                    flex.addItem(aView).width(20).minWidth(300).height(200)
                }
                
                rootFlexContainer.flex.layout()
                expect(aView.frame).to(equal(CGRect(x: 0.0, y: 0.0, width: 300.0, height: 200.0)))
            }
            
            it("minWidth") {
                rootFlexContainer.flex.define { (flex) in
                    flex.addItem(aView).width(20).minWidth(300).height(200)
                }
                
                // Later reset the aspectRatio
                aView.flex.minWidth(0)
                rootFlexContainer.flex.layout()
                expect(aView.frame).to(equal(CGRect(x: 0.0, y: 0.0, width: 20.0, height: 200.0)))
            }
        }
    }
}
