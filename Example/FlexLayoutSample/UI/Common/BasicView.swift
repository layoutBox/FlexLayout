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

class BasicView: UIView {
    fileprivate let label = UILabel()
    
    init(text: String? = nil) {
        super.init(frame: .zero)

        backgroundColor = UIColor(red:0.58, green:0.78, blue:0.95, alpha:1.00)
        layer.borderColor = UIColor(red:0.37, green:0.67, blue:0.94, alpha:1.00).cgColor
        layer.borderWidth = 2
               
        label.text = text
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        label.sizeToFit()
        addSubview(label)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
            
        label.pin.center()
    }
    
    var sizeThatFitsExpectedArea: CGFloat = 40 * 40
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var newSize = CGSize()
        if size.width != CGFloat.greatestFiniteMagnitude {
            newSize.width = size.width
            newSize.height = sizeThatFitsExpectedArea / newSize.width
        } else if size.height != CGFloat.greatestFiniteMagnitude {
            newSize.height = size.height
            newSize.width = sizeThatFitsExpectedArea / newSize.height
        } else {
            newSize.width = 40
            newSize.height = sizeThatFitsExpectedArea / newSize.width
        }
        
        return newSize
    }
}
