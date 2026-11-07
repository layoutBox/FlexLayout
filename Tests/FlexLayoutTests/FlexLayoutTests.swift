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

import Testing
import UIKit
@testable import FlexLayout

@MainActor
struct FlexLayoutTests {

    @Test
    func flexDoesNotCreateRetainCycle() {
        weak var weakView: UIView? = nil
        _ = { _ in
            let strongView = UIView()
            strongView.flex.direction(.column)
            weakView = strongView
        }(())

        #expect(weakView == nil, "Creation of flex should not lead to retain cycle")
    }
  
    
    @Test
    func removeViewDynamically() {
        let rootFlexContainer = UIView()
        rootFlexContainer.flex.addItem(UIView())
        rootFlexContainer.flex.define { _ in }
        rootFlexContainer.flex.layout()
        
        rootFlexContainer.subviews.forEach { $0.removeFromSuperview() }
        rootFlexContainer.flex.markDirty()
        rootFlexContainer.flex.layout()

        #expect(rootFlexContainer.subviews.isEmpty)
    }

    @Test
    func layoutPreservesNonFlexViewFrameAcrossLayouts() {
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        let originalFrame = CGRect(x: 30, y: 40, width: 50, height: 60)
        let overlay = UIView(frame: originalFrame)
        container.addSubview(overlay)

        // An enabled Flex sibling makes the container non-leaf.
        let flexView = UIView()
        container.flex.addItem(flexView).width(100%).height(20)

        container.flex.layout()

        #expect(overlay.frame == originalFrame)
        #expect(!overlay.isFlexEnabled)
        #expect(flexView.frame == CGRect(x: 0, y: 0, width: 200, height: 20))

        let updatedFrame = CGRect(x: 45, y: 55, width: 65, height: 75)
        overlay.frame = updatedFrame
        container.frame.size.width = 300

        container.flex.layout()

        #expect(overlay.frame == updatedFrame)
        #expect(!overlay.isFlexEnabled)
        #expect(flexView.frame == CGRect(x: 0, y: 0, width: 300, height: 20))
    }

    @Test
    func layoutPreservesNonFlexSubtreeFrames() {
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        container.flex.addItem().width(20).height(20)

        let overlayFrame = CGRect(x: 30, y: 40, width: 50, height: 60)
        let overlay = UIView(frame: overlayFrame)
        let childFrame = CGRect(x: 5, y: 6, width: 7, height: 8)
        let child = UIView(frame: childFrame)
        child.flex.width(10).height(10)
        overlay.addSubview(child)
        container.addSubview(overlay)

        container.flex.layout()

        #expect(overlay.frame == overlayFrame)
        #expect(child.frame == childFrame)
        #expect(!overlay.isFlexEnabled)
    }

    @Test
    func layoutUpdatesSubtreeWhenInclusionChanges() {
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        let excludedFrame = CGRect(x: 30, y: 40, width: 50, height: 60)
        let excludedView = UIView(frame: excludedFrame)
        container.flex.addItem(excludedView).width(100).height(100).isIncludedInLayout(false)
        let childFrame = CGRect(x: 5, y: 6, width: 7, height: 8)
        let child = UIView(frame: childFrame)
        excludedView.flex.addItem(child).width(10).height(10)
        let flexView = UIView()
        container.flex.addItem(flexView).width(20).height(20)

        container.flex.layout()

        #expect(excludedView.frame == excludedFrame)
        #expect(child.frame == childFrame)
        #expect(flexView.frame == CGRect(x: 0, y: 0, width: 20, height: 20))

        excludedView.flex.isIncludedInLayout = true
        container.flex.layout()

        #expect(excludedView.frame == CGRect(x: 0, y: 0, width: 100, height: 100))
        #expect(child.frame == CGRect(x: 0, y: 0, width: 10, height: 10))
        #expect(flexView.frame == CGRect(x: 0, y: 100, width: 20, height: 20))

        excludedView.flex.isIncludedInLayout = false
        excludedView.frame = excludedFrame
        child.frame = childFrame
        container.flex.layout()

        #expect(excludedView.frame == excludedFrame)
        #expect(child.frame == childFrame)
        #expect(flexView.frame == CGRect(x: 0, y: 0, width: 20, height: 20))
    }

    @Test
    func layoutAppliesFramesToIncludedFlexDescendants() {
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        let nestedContainer = UIView()
        let child = UIView()
        container.flex.addItem(nestedContainer).width(100).height(100).padding(10)
        nestedContainer.flex.addItem(child).width(20).height(30)

        container.flex.layout()

        #expect(nestedContainer.frame == CGRect(x: 0, y: 0, width: 100, height: 100))
        #expect(child.frame == CGRect(x: 10, y: 10, width: 20, height: 30))
    }
}
