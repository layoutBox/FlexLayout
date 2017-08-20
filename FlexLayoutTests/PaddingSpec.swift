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

class PaddingSpec: QuickSpec {
    override func spec() {
        var viewController: UIViewController!
        var rootFlexContainer: UIView!
        var aView: UIView!

        beforeSuite {
        }
        
        beforeEach {
            viewController = UIViewController()
            
            rootFlexContainer = UIView()
            rootFlexContainer.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            viewController.view.addSubview(rootFlexContainer)
            
            aView = UIView()
        }
        
        describe("") {
            it("adjust the aView size and position") {
                rootFlexContainer.flex.paddingTop(10).define { (flex) in
                    flex.addItem(aView).grow(1)
                }
                
                rootFlexContainer.flex.layout()
                expect(aView.frame).to(equal(CGRect(x: 0.0, y: 10.0, width: 400.0, height: 390.0)))
            }
            
            it("adjust the aView size and position") {
                rootFlexContainer.flex.paddingLeft(10).define { (flex) in
                    flex.addItem(aView).grow(1)
                }
                rootFlexContainer.flex.layout()
                expect(aView.frame).to(equal(CGRect(x: 10.0, y: 0.0, width: 390.0, height: 400.0)))
            }
            
            it("adjust the aView size and position") {
                rootFlexContainer.flex.paddingBottom(10).define { (flex) in
                    flex.addItem(aView).grow(1)
                }
                rootFlexContainer.flex.layout()
                expect(aView.frame).to(equal(CGRect(x: 0.0, y: 0.0, width: 400.0, height: 390.0)))
            }
            
            it("adjust the aView size and position") {
                rootFlexContainer.flex.paddingRight(10).define { (flex) in
                    flex.addItem(aView).grow(1)
                }
                rootFlexContainer.flex.layout()
                expect(aView.frame).to(equal(CGRect(x: 0.0, y: 0.0, width: 390.0, height: 400.0)))
            }
            
            it("adjust the aView size and position") {
                rootFlexContainer.flex.padding(10).define { (flex) in
                    flex.addItem(aView).grow(1)
                }
                rootFlexContainer.flex.layout()
                expect(aView.frame).to(equal(CGRect(x: 10.0, y: 10.0, width: 380.0, height: 380.0)))
            }
            
            it("adjust the aView size and position") {
                rootFlexContainer.flex.padding(10, 20, 30, 40).define { (flex) in
                    flex.addItem(aView).grow(1)
                }
                rootFlexContainer.flex.layout()
                expect(aView.frame).to(equal(CGRect(x: 20.0, y: 10.0, width: 340.0, height: 360.0)))
            }
            
            it("adjust the aView size and position") {
                rootFlexContainer.flex.paddingStart(10).define { (flex) in
                    flex.addItem(aView).grow(1)
                }
                rootFlexContainer.flex.layout()
                expect(aView.frame).to(equal(CGRect(x: 10.0, y: 0.0, width: 390.0, height: 400.0)))
            }
            
            it("adjust the aView size and position") {
                rootFlexContainer.flex.paddingEnd(10).define { (flex) in
                    flex.addItem(aView).grow(1)
                }
                rootFlexContainer.flex.layout()
                expect(aView.frame).to(equal(CGRect(x: 0.0, y: 0.0, width: 390.0, height: 400.0)))
            }
            
            it("adjust the aView size and position") {
                rootFlexContainer.flex.paddingVertical(10).define { (flex) in
                    flex.addItem(aView).grow(1)
                }
                rootFlexContainer.flex.layout()
                expect(aView.frame).to(equal(CGRect(x: 0.0, y: 10.0, width: 400.0, height: 380.0)))
            }
            
            it("adjust the aView size and position") {
                rootFlexContainer.flex.paddingHorizontal(10).define { (flex) in
                    flex.addItem(aView).grow(1)
                }
                rootFlexContainer.flex.layout()
                expect(aView.frame).to(equal(CGRect(x: 10.0, y: 0.0, width: 380.0, height: 400.0)))
            }
        }
    }
}
