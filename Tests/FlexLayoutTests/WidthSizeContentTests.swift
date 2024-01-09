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
import XCTest

final class WidthSizeContentTests: XCTestCase {

    var viewController: UIViewController!
    var rootFlexContainer: UIView!
    var aView: UIView!
    var bView: UIView!

    override func setUp() {
        super.setUp()

        viewController = UIViewController()

        rootFlexContainer = UIView()
        rootFlexContainer.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        viewController.view.addSubview(rootFlexContainer)

        aView = UIView()
        bView = UIView()
    }

    func test_basis_adjust_aView_size_and_position() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).width(100).height(200)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 100.0, height: 200.0))
    }

    func test_basis_adjust_aView_size_and_position_with_aspectRatio() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).width(200).aspectRatio(2)
        }

        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 200.0, height: 100.0))
    }

    func test_basis_adjust_aView_size_and_position_with_aspectRatio_reset() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).width(200).aspectRatio(2)
        }

        // Later reset the aspectRatio
        aView.flex.aspectRatio(nil)
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 200.0, height: 0.0))
    }

    func test_basis_adjust_aView_size_and_position_with_width_height() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).width(200).minWidth(100).height(200).minHeight(100)
        }

        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 200.0, height: 200.0))
    }

    func test_basis_adjust_aView_size_and_position_with_width_height_reset() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).width(200).minWidth(100).height(200).minHeight(100)
        }

        // Later reset the width and the height
        aView.flex.width(nil)
        aView.flex.height(nil)
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 400.0, height: 100.0))
    }

    func test_basis_adjust_aView_size_and_position_with_minWidth() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).width(200).minWidth(300).height(200)
        }

        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 300.0, height: 200.0))
    }

    func test_basis_adjust_aView_size_and_position_with_minWidth_reset() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).width(200).maxWidth(300).height(200)
        }

        // Later reset the minWidth
        aView.flex.minWidth(nil)
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 200.0, height: 200.0))
    }

    func test_basis_adjust_aView_size_and_position_with_maxWidth() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).maxWidth(300).height(200)
        }

        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 300.0, height: 200.0))
    }

    func test_basis_adjust_aView_size_and_position_with_maxWidth_reset() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).maxWidth(300).height(200)
        }

        // Later reset the width and the height
        aView.flex.maxWidth(nil)
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 400.0, height: 200.0))
    }

    func test_basis_adjust_aView_size_and_position_with_minHeight() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).height(200).minHeight(300)
        }

        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 400.0, height: 300.0))
    }

    func test_basis_adjust_aView_size_and_position_with_minHeight_reset() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).height(200).minHeight(300)
        }

        // Later reset the minHeight
        aView.flex.minHeight(nil)
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 400.0, height: 200.0))
    }

    func test_basis_adjust_aView_size_and_position_with_maxHeight() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).height(200).maxHeight(100)
        }

        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 400.0, height: 100.0))
    }

    func test_basis_adjust_aView_size_and_position_with_maxHeight_reset() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).height(200).maxHeight(100)
        }

        // Later reset the maxHeight
        aView.flex.maxHeight(nil)
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 400.0, height: 200.0))
    }
    
    func test_gap() {
        rootFlexContainer.flex.direction(.row).define { flex in
            flex.addItem(aView).height(100).width(100)
            flex.addItem(bView).height(100).width(100)
            flex.alignItems(.start)
            
            flex.setGap(.row, 50)
        }

        rootFlexContainer.flex.layout()
        XCTAssertEqual(bView.frame, CGRect(x: 150.0, y: 0.0, width: 100.0, height: 100.0))
    }
}
