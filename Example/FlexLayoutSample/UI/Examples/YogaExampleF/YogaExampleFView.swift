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
//
// Created by Michael Ong on 2020-05-27.

import UIKit
import FlexLayout
import PinLayout

class YogaExampleFView: UIView {
    fileprivate let rootFlexContainer = UIView()

    init() {
        super.init(frame: .zero)
        backgroundColor = .white

        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor

        // Yoga's Android example
        rootFlexContainer.flex.padding(20).direction(.column).define {

            $0.addItem().direction(.row).alignItems(.baseline).marginBottom(20).define {

                let label = UILabel()

                label.font = .systemFont(ofSize: 20)
                label.text = "Leading Font"

                $0.addItem(label).marginRight(5).markDirty()

                let info = UILabel()

                info.font = .systemFont(ofSize: 10)
                info.text = "Trailing Font"

                $0.addItem(info).markDirty()
            }

            $0.addItem().direction(.row).alignItems(.baseline).marginBottom(20).define {

                let label = UILabel()

                label.font = .systemFont(ofSize: 20)
                label.text = "Leading Multiline\nText Oh yeah!"
                label.numberOfLines = 2

                $0.addItem(label).marginRight(5).markDirty()

                let info = UILabel()

                info.font = .systemFont(ofSize: 10)
                info.text = "Trailing Font"

                $0.addItem(info).markDirty()
            }

            $0.addItem().direction(.row).alignItems(.baseline).marginBottom(20).define {

                let label = UILabel()

                label.font = .systemFont(ofSize: 12)
                label.text = "Name:"
                label.numberOfLines = 2

                $0.addItem(label).marginRight(5).markDirty()

                let info = UITextField()

                info.font = .systemFont(ofSize: 16)
                info.placeholder = "Enter name here!"

                $0.addItem(info).markDirty()
            }

            $0.addItem().direction(.row).alignItems(.baseline).marginBottom(20).define {

                let label = UILabel()

                label.font = .systemFont(ofSize: 12)
                label.text = "Age:"
                label.numberOfLines = 2

                $0.addItem(label).marginRight(5).markDirty()

                let info = UITextField()

                info.borderStyle = .roundedRect

                info.font = .systemFont(ofSize: 16)
                info.placeholder = "Enter name here!"

                $0.addItem(info).markDirty()
            }

            $0.addItem().direction(.row).alignItems(.baseline).marginBottom(20).define {

                let label = UILabel()

                label.font = .systemFont(ofSize: 12)
                label.text = "Status:"
                label.numberOfLines = 2

                $0.addItem(label).marginRight(5).markDirty()

                let info = UITextField()

                info.borderStyle = .line

                info.font = .systemFont(ofSize: 16)
                info.placeholder = "Enter name here!"

                $0.addItem(info).markDirty()
            }

            $0.addItem().direction(.row).alignItems(.baseline).marginBottom(20).define {

                let label = UILabel()

                label.font = .systemFont(ofSize: 12)
                label.text = "Gender:"
                label.numberOfLines = 2

                $0.addItem(label).marginRight(5).markDirty()

                let info = UITextField()

                info.borderStyle = .bezel

                info.font = .systemFont(ofSize: 16)
                info.placeholder = "Enter name here!"

                $0.addItem(info).markDirty()
            }

            $0.addItem().direction(.row).alignItems(.baseline).marginBottom(20).define {

                let label = UILabel()

                label.font = .systemFont(ofSize: 12)
                label.text = "About:"
                label.numberOfLines = 2

                $0.addItem(label).marginRight(5).markDirty()

                let info = UITextView()

                info.font = .systemFont(ofSize: 16)
                info.text = "Place text here!"

                $0.addItem(info).grow(1).height(200).markDirty()
            }
        }
        addSubview(rootFlexContainer)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Layout the flexbox container using PinLayout
        // NOTE: Could be also layouted by setting directly rootFlexContainer.frame
        rootFlexContainer.pin.top(pin.safeArea).horizontally(pin.safeArea).height(300)

        // Then let the flexbox container layout itself
        rootFlexContainer.flex.layout()
    }
}
