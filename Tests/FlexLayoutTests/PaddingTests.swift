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

final class PaddingTests: XCTestCase {

    var viewController: UIViewController!
    var rootFlexContainer: UIView!
    var aView: UIView!

    override func setUp() {
        super.setUp()

        viewController = UIViewController()

        rootFlexContainer = UIView()
        rootFlexContainer.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        viewController.view.addSubview(rootFlexContainer)

        aView = UIView()
    }

    func test_adjust_the_aView_size_and_position_with_paddingTop() {
        rootFlexContainer.flex.paddingTop(10).define { flex in
            flex.addItem(aView).grow(1)
        }

        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 10.0, width: 400.0, height: 390.0))
    }

    func test_adjust_the_aView_size_and_position_with_paddingTop_percent() {
        rootFlexContainer.flex.paddingTop(10%).define { flex in
            flex.addItem(aView).grow(1)
        }

        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 40.0, width: 400.0, height: 360.0))
    }

    func test_adjust_the_aView_size_and_position_with_paddingLeft() {
        rootFlexContainer.flex.paddingLeft(10).define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 10.0, y: 0.0, width: 390.0, height: 400.0))
    }

    func test_adjust_the_aView_size_and_position_with_paddingLeft_percent() {
        rootFlexContainer.flex.paddingLeft(10%).define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 40.0, y: 0.0, width: 360.0, height: 400.0))
    }

    func test_adjust_the_aView_size_and_position_with_paddingBottom() {
        rootFlexContainer.flex.paddingBottom(10).define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 400.0, height: 390.0))
    }

    func test_adjust_the_aView_size_and_position_with_paddingBottom_percent() {
        rootFlexContainer.flex.paddingBottom(10%).define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 400.0, height: 360.0))
    }

    func test_adjust_the_aView_size_and_position_with_paddingRight() {
        rootFlexContainer.flex.paddingRight(10).define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 390.0, height: 400.0))
    }

    func test_adjust_the_aView_size_and_position_with_paddingRight_percent() {
        rootFlexContainer.flex.paddingRight(10%).define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 360.0, height: 400.0))
    }

    func test_adjust_the_aView_size_and_position_with_padding_all() {
        rootFlexContainer.flex.padding(10).define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 10.0, y: 10.0, width: 380.0, height: 380.0))
    }

    func test_adjust_the_aView_size_and_position_with_padding_all_percent() {
        rootFlexContainer.flex.padding(10%).define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 40.0, y: 40.0, width: 320.0, height: 320.0))
    }

    func test_adjust_the_aView_size_and_position_with_padding() {
        rootFlexContainer.flex.padding(10, 20, 30, 40).define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 20.0, y: 10.0, width: 340.0, height: 360.0))
    }

    func test_adjust_the_aView_size_and_position_with_padding_percent() {
        rootFlexContainer.flex.padding(10%, 20%, 30%, 40%).define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 80.0, y: 40.0, width: 160.0, height: 240.0))
    }

    func test_adjust_the_aView_size_and_position_with_paddingStart() {
        rootFlexContainer.flex.paddingStart(10).define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 10.0, y: 0.0, width: 390.0, height: 400.0))
    }

    func test_adjust_the_aView_size_and_position_with_paddingStart_percent() {
        rootFlexContainer.flex.paddingStart(10%).define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 40.0, y: 0.0, width: 360.0, height: 400.0))
    }

    func test_adjust_the_aView_size_and_position_with_paddingEnd() {
        rootFlexContainer.flex.paddingEnd(10).define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 390.0, height: 400.0))
    }

    func test_adjust_the_aView_size_and_position_with_paddingEnd_percent() {
        rootFlexContainer.flex.paddingEnd(10%).define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 360.0, height: 400.0))
    }

    func test_adjust_the_aView_size_and_position_with_paddingVertical() {
        rootFlexContainer.flex.paddingVertical(10).define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 10.0, width: 400.0, height: 380.0))
    }

    func test_adjust_the_aView_size_and_position_with_paddingVertical_percent() {
        rootFlexContainer.flex.paddingVertical(10%).define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 40.0, width: 400.0, height: 320.0))
    }

    func test_adjust_the_aView_size_and_position_with_paddingHorizontal() {
        rootFlexContainer.flex.paddingHorizontal(10).define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 10.0, y: 0.0, width: 380.0, height: 400.0))
    }

    func test_adjust_the_aView_size_and_position_with_paddingHorizontal_percent() {
        rootFlexContainer.flex.paddingHorizontal(10%).define { flex in
            flex.addItem(aView).grow(1)
        }
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 40.0, y: 0.0, width: 320.0, height: 400.0))
    }
}
