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

class CheckBox: UIButton {
    fileprivate static let margin: CGFloat = 8
    fileprivate let checkImageView = UIImageView(image: UIImage(named: "filter-box-check"))
    fileprivate let textLabel = UILabel()

    var checked = false {
        didSet {
            updateCheckState()
        }
    }

    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1.0 : 0.5
        }
    }

    init(text: String? = nil) {
        super.init(frame: CGRect.zero)

        backgroundColor = .blue
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 2

        checkImageView.alpha = 0
        addSubview(checkImageView)

//        textLabel.setProperties(text: text, font: UIFont.systemFont(ofSize: 15), textColor: .black, fit: true)
        addSubview(textLabel)

        addTarget(self, action: #selector(didTapCheckBox), for: .touchUpInside)

        updateCheckState()

//        sizeToFit()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutView()
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        frame = CGRect(origin: .zero, size: size)
        return layoutView()
    }

    @discardableResult
    fileprivate func layoutView() -> CGSize {
        layer.cornerRadius = frame.height / 2

//        let hPadding = 30.f

//        textLabel.layout.leftCenter(leftCenter).leftMargin(hPadding)
//        textLabel.setPosition(.PositionVCenterLeft, margins: .left(hPadding))
//        checkImageView.setRelativePosition(.RelativePositionToTheRightCentered, toView: textLabel, margins: .left(14))
        checkImageView.pin.center().size(30)

        return CGSize(width: 40, height: 40)
    }
}

// MARK: Control events
extension CheckBox {
    func didTapCheckBox() {
        if isEnabled {
            checked = !checked
            sendActions(for: .valueChanged)
        }
    }
}

// MARK: Private
extension CheckBox {
    fileprivate func updateCheckState() {
        UIView.animateKeyframes(withDuration: 0.2, delay: 0, options: UIViewKeyframeAnimationOptions.beginFromCurrentState, animations: { () -> Void in
            self.backgroundColor = self.checked ? .green : .clear
            self.checkImageView.alpha = self.checked ? 1 : 0
//            self.textLabel.setProperties(textColor: self.checked ? .white : .yellow)
        }, completion: nil)
    }
}
