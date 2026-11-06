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

import FlexLayout
import Testing
import UIKit

@MainActor
struct WidthSizeContentTests {

    var viewController: UIViewController!
    var rootFlexContainer: UIView!
    var aView: UIView!
    var bView: UIView!
    var cView: UIView!

    init() {

        viewController = UIViewController()

        rootFlexContainer = UIView()
        rootFlexContainer.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        viewController.view.addSubview(rootFlexContainer)

        aView = UIView()
        bView = UIView()
        cView = UIView()
    }

    @Test
    func basisAdjustAViewSizeAndPosition() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).width(100).height(200)
        }
        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 0.0, y: 0.0, width: 100.0, height: 200.0))
    }

    @Test
    func basisAdjustAViewSizeAndPositionWithAspectRatio() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).width(200).aspectRatio(2)
        }

        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 0.0, y: 0.0, width: 200.0, height: 100.0))
    }

    @Test
    func basisAdjustAViewSizeAndPositionWithAspectRatioReset() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).width(200).aspectRatio(2)
        }

        // Later reset the aspectRatio
        aView.flex.aspectRatio(nil)
        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 0.0, y: 0.0, width: 200.0, height: 0.0))
    }

    @Test
    func basisAdjustAViewSizeAndPositionWithWidthHeight() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).width(200).minWidth(100).height(200).minHeight(100)
        }

        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 0.0, y: 0.0, width: 200.0, height: 200.0))
    }

    @Test
    func basisAdjustAViewSizeAndPositionWithWidthHeightReset() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).width(200).minWidth(100).height(200).minHeight(100)
        }

        // Later reset the width and the height
        aView.flex.width(nil)
        aView.flex.height(nil)
        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 0.0, y: 0.0, width: 400.0, height: 100.0))
    }

    @Test
    func basisAdjustAViewSizeAndPositionWithMinWidth() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).width(200).minWidth(300).height(200)
        }

        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 0.0, y: 0.0, width: 300.0, height: 200.0))
    }

    @Test
    func basisAdjustAViewSizeAndPositionWithMinWidthReset() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).width(200).maxWidth(300).height(200)
        }

        // Later reset the minWidth
        aView.flex.minWidth(nil)
        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 0.0, y: 0.0, width: 200.0, height: 200.0))
    }

    @Test
    func basisAdjustAViewSizeAndPositionWithMaxWidth() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).maxWidth(300).height(200)
        }

        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 0.0, y: 0.0, width: 300.0, height: 200.0))
    }

    @Test
    func basisAdjustAViewSizeAndPositionWithMaxWidthReset() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).maxWidth(300).height(200)
        }

        // Later reset the width and the height
        aView.flex.maxWidth(nil)
        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 0.0, y: 0.0, width: 400.0, height: 200.0))
    }

    @Test
    func basisAdjustAViewSizeAndPositionWithMinHeight() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).height(200).minHeight(300)
        }

        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 0.0, y: 0.0, width: 400.0, height: 300.0))
    }

    @Test
    func basisAdjustAViewSizeAndPositionWithMinHeightReset() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).height(200).minHeight(300)
        }

        // Later reset the minHeight
        aView.flex.minHeight(nil)
        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 0.0, y: 0.0, width: 400.0, height: 200.0))
    }

    @Test
    func basisAdjustAViewSizeAndPositionWithMaxHeight() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).height(200).maxHeight(100)
        }

        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 0.0, y: 0.0, width: 400.0, height: 100.0))
    }

    @Test
    func basisAdjustAViewSizeAndPositionWithMaxHeightReset() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).height(200).maxHeight(100)
        }

        // Later reset the maxHeight
        aView.flex.maxHeight(nil)
        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 0.0, y: 0.0, width: 400.0, height: 200.0))
    }
    
    @Test
    func rowGap() {
        rootFlexContainer.flex.direction(.row).define { flex in
            flex.addItem(aView).height(100).width(100)
            flex.addItem(bView).height(100).width(100)
            flex.alignItems(.start)
            
            flex.columnGap(50)
        }

        rootFlexContainer.flex.layout()
        #expect(bView.frame == CGRect(x: 150.0, y: 0.0, width: 100.0, height: 100.0))
    }

    @Test
    func columnGap() {
        rootFlexContainer.flex.direction(.column).define { flex in
            flex.addItem(aView).height(100).width(100)
            flex.addItem(bView).height(100).width(100)
            flex.alignItems(.start)
            
            flex.rowGap(50)
        }

        rootFlexContainer.flex.layout()
        #expect(bView.frame == CGRect(x: 0.0, y: 150.0, width: 100.0, height: 100.0))
    }
    
    @Test
    func gap() {
        rootFlexContainer.flex.direction(.column).define { flex in
            flex.addItem().direction(.row).define { flex in
                flex.addItem(aView).height(100).width(100)
                flex.addItem(bView).height(100).width(100)
                flex.gap(50)
            }
            flex.addItem(cView).height(100).width(100)
            
            flex.alignItems(.start)
            flex.gap(50)
        }

        rootFlexContainer.flex.layout()

        #expect(bView.frame == CGRect(x: 150.0, y: 0.0, width: 100.0, height: 100.0))
        #expect(cView.frame == CGRect(x: 0.0, y: 150.0, width: 100.0, height: 100.0))
    }
}
