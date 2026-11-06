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
struct MarginTests {

    var viewController: UIViewController!
    var rootFlexContainer: UIView!
    var aView: UIView!

    init() {

        viewController = UIViewController()

        rootFlexContainer = UIView()
        rootFlexContainer.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        viewController.view.addSubview(rootFlexContainer)

        aView = UIView()
    }

    @Test
    func adjustTheRootFlexContainerSizeAndPosition() {
        rootFlexContainer.flex.define { _ in
        }
        rootFlexContainer.flex.layout()
        #expect(rootFlexContainer.frame == CGRect(x: 0.0, y: 0.0, width: 400.0, height: 400.0))
    }

    @Test
    func adjustTheAViewSizeAndPosition() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 0.0, y: 0.0, width: 400.0, height: 400.0))
    }

    @Test
    func adjustTheAViewSizeAndPositionWithMarginLeft() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).grow(1).marginLeft(10)
        }
        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 10.0, y: 0.0, width: 390.0, height: 400.0))
    }

    @Test
    func adjustTheAViewSizeAndPositionWithMarginTop() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).grow(1).marginTop(10)
        }
        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 0.0, y: 10.0, width: 400.0, height: 390.0))
    }

    @Test
    func adjustTheAViewSizeAndPositionWithMarginBottom() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).grow(1).marginBottom(10)
        }
        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 0.0, y: 0.0, width: 400.0, height: 390.0))
    }

    @Test
    func adjustTheAViewSizeAndPositionWithMarginStart() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).grow(1).marginStart(10)
        }
        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 10.0, y: 0.0, width: 390.0, height: 400.0))
    }

    @Test
    func adjustTheAViewSizeAndPositionWithMarginEnd() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).grow(1).marginEnd(10)
        }
        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 0.0, y: 0.0, width: 390.0, height: 400.0))
    }

    @Test
    func adjustTheAViewSizeAndPositionWithMargin() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).grow(1).margin(10, 20, 30, 40)
        }
        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 20.0, y: 10.0, width: 340.0, height: 360.0))
    }

    @Test
    func adjustTheAViewSizeAndPositionWithMarginAll() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).grow(1).margin(10)
        }
        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 10.0, y: 10.0, width: 380.0, height: 380.0))
    }

    @Test
    func adjustTheAViewSizeAndPositionWithMarginVertical() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).grow(1).marginVertical(10)
        }
        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 0.0, y: 10.0, width: 400.0, height: 380.0))
    }

    @Test
    func adjustTheAViewSizeAndPositionWithMarginHorizontal() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).grow(1).marginHorizontal(10)
        }
        rootFlexContainer.flex.layout()
        #expect(aView.frame == CGRect(x: 10.0, y: 0.0, width: 380.0, height: 400.0))
    }
}
