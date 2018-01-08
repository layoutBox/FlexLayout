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

class BaseView: UIView {
    private var legacySafeArea: UIEdgeInsets = .zero
    
    // safeArea returns UIView.safeAreaInsets for iOS 11+ or
    // an UIEdgeInsets initialized with the UIViewController's topLayoutGuide and
    // bottomLayoutGuide for other iOS versions.
    var safeArea: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return safeAreaInsets
        } else {
            return legacySafeArea
        }
    }
    
    func setSafeArea(_ safeArea: UIEdgeInsets) {
        guard safeArea != self.safeArea else { return }
        legacySafeArea = safeArea
        safeAreaDidChange()
    }
    
    func safeAreaDidChange() {
        setNeedsLayout()
    }
    
    override func safeAreaInsetsDidChange() {
        safeAreaDidChange()
    }
}
