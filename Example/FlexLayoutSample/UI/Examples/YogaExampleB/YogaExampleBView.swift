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
// Created by Luc Dion on 2017-07-17.

import UIKit
import FlexLayout
import PinLayout

class YogaExampleBView: UIView {
    fileprivate let rootFlexContainer = UIView()

    init() {
        super.init(frame: .zero)

        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor

        let label = UIView()
        label.backgroundColor = .black

        // Yoga's Objective-C Example
        rootFlexContainer.flex.alignItems(.center).justifyContent(.center).padding(20).define { (flex) in
            flex.addItem(imageView).size(150).aspectRatio(1).marginBottom(20)
            flex.addItem(label).width(100).height(25)
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
        rootFlexContainer.pin.top(pin.safeArea).horizontally(pin.safeArea).height(200)
        
        // Then let the flexbox container layout itself
        rootFlexContainer.flex.layout()
    }
}
