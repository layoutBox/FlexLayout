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
// Created by Luc Dion on 2017-06-19.

import UIKit
import YogaKit

public class Flex {
    public let view: UIView

    public enum Direction {
        case column
        case columnReverse
        case row
        case rowReverse
    }

    public enum Overflow {
        case visible
        case hidden
        case scroll
    }

    public enum Justify {
        case start
        case end
        case center
        case spaceBetween
        case spaceAround
    }

    public enum Align {
        case start
        case end
        case center
        case stretch
        case baseline
        case auto       // Used only by alignSelf
    }

    public enum Wrap {
        case noWrap
        case wrap
        case wrapReverse
    }

    public enum Position {
        case relative
        case absolute
    }
    
    public enum LayoutDirection {
        case inherit    // default
        case ltr        // Left to right
        case rtl        // Right to right
        //case auto       // Detected automatically
    }

    init(view: UIView) {
        self.view = view
        // Enable flexbox and overwrite Yoga default values.
        view.yoga.isEnabled = true
        //view.yoga.flexShrink = 1 // Cause Yoga's issues?
    }

    public var intrinsicSize: CGSize {
        return view.yoga.intrinsicSize
    }
    
    
    //
    // Creation / definition
    //
    @discardableResult
    public func addContainer() -> Flex {
        let view = UIView()
        return addItem(view)
    }
    
    @discardableResult
    public func addItem() -> Flex {
        let view = UIView()
        return addItem(view)
    }
    
    @discardableResult
    public func addItem(_ view: UIView) -> Flex {
        self.view.addSubview(view)
        return view.flex
    }

    @discardableResult
    public func define(_ closure: (_ flex: Flex) -> Void) -> Flex {
        closure(self)
        return self
    }
    
    @discardableResult
    public func markDirty() -> Flex {
        view.yoga.markDirty()
        return self
    }

    //
    // Layout / sizeThatFits
    //
    public enum LayoutMode {
        case fitContainer
        case adjustHeight
        case adjustWidth
    }

    public func layout(mode: LayoutMode = .fitContainer) {
        if case .fitContainer = mode {
            view.yoga.applyLayout(preservingOrigin: true)
        } else {
            view.yoga.applyLayout(preservingOrigin: true, dimensionFlexibility: mode == .adjustWidth ? YGDimensionFlexibility.flexibleWidth : YGDimensionFlexibility.flexibleHeigth)
        }
    }
    
    public var isIncludedInLayout: Bool = true {
        didSet {
            view.yoga.isIncludedInLayout = isIncludedInLayout
        }
    }
    
    @discardableResult
    public func isIncludedInLayout(_ included: Bool) -> Flex {
        self.isIncludedInLayout = included
        return self
    }

    public func sizeThatFits(size: CGSize) -> CGSize {
        return view.yoga.calculateLayout(with: size)
    }
    
    //
    // direction, wrap, flow
    //
    ///
    ///
    /// - Parameter value: Default value is .column
    @discardableResult
    public func direction(_ value: Direction) -> Flex {
        view.yoga.flexDirection = value.yogaValue
        return self
    }
    
    ///
    ///
    /// - Parameter value: Default value is .noWrap
    @discardableResult
    public func wrap(_ value: Wrap) -> Flex {
        view.yoga.flexWrap = value.yogaValue
        return self
    }
    
    @discardableResult
    public func layoutDirection(_ value: LayoutDirection) -> Flex {
        // WORK IN PROGRESS :-)
        /*switch value {
        case .auto:
            let userInterfaceLayoutDirection: UIUserInterfaceLayoutDirection
            if #available(iOS 9.0, *) {
                userInterfaceLayoutDirection = UIView.userInterfaceLayoutDirection(for: view.semanticContentAttribute)
            } else {
                userInterfaceLayoutDirection = UIApplication.shared.userInterfaceLayoutDirection
            }
            view.yoga.direction = userInterfaceLayoutDirection == .leftToRight ? YGDirection.LTR : YGDirection.RTL
        default:*/
        view.yoga.direction = value.yogaValue
        //}
        return self
    }
    
    //
    // justity, alignment / position
    //
    
    ///
    ///
    /// - Parameter value: Default value is .start
    @discardableResult
    public func justifyContent(_ value: Justify) -> Flex {
        view.yoga.justifyContent = value.yogaValue
        return self
    }
    
    ///
    ///
    /// - Parameter value: Default value is .start
    @discardableResult
    public func alignContent(_ value: Align) -> Flex {
        view.yoga.alignContent = value.yogaValue
        return self
    }
    
    ///
    ///
    /// - Parameter value: Default value is .auto
    @discardableResult
    public func alignSelf(_ value: Align) -> Flex {
        view.yoga.alignSelf = value.yogaValue
        return self
    }

    ///
    ///
    /// - Parameter value: Default value is .stretch
    @discardableResult
    public func alignItems(_ value: Align) -> Flex {
        view.yoga.alignItems = value.yogaValue
        return self
    }
    
    ///
    ///
    /// - Parameter value: Default value is .relative
    @discardableResult
    public func position(_ value: Position) -> Flex {
        view.yoga.position = value.yogaValue
        return self
    }

    ///
    ///
    /// - Parameter value: Default value is .visible
    @discardableResult
    public func overflow(_ value: Overflow) -> Flex {
        view.yoga.overflow = value.yogaValue
        return self
    }
    
    //
    // grow / shrink / basis
    //
    
    ///
    ///
    /// - Parameter value: Default value is 0
    @discardableResult
    public func grow(_ value: CGFloat) -> Flex {
        view.yoga.flexGrow = value
       return self
    }
    
    ///
    ///
    /// - Parameter value: Default value is 1
    @discardableResult
    public func shrink(_ value: CGFloat) -> Flex {
        view.yoga.flexShrink = value
        return self
    }

    ///
    ///
    /// - Parameter value: Default value is 0
    @discardableResult
    public func basis(_ value: CGFloat?) -> Flex {
        if let value = value {
            view.yoga.flexBasis = YGValue(value)
        } else {
            view.yoga.flexBasis = YGValueAuto
        }
        return self
    }

    //
    // left / top / right / bottom / start / end
    //
    @discardableResult
    public func left(_ value: CGFloat) -> Flex {
        view.yoga.left = YGValue(value)
        return self
    }

    @discardableResult
    public func top(_ value: CGFloat) -> Flex {
        view.yoga.top = YGValue(value)
        return self
    }

    @discardableResult
    public func right(_ value: CGFloat) -> Flex {
        view.yoga.right = YGValue(value)
        return self
    }

    @discardableResult
    public func bottom(_ value: CGFloat) -> Flex {
        view.yoga.bottom = YGValue(value)
        return self
    }

    @discardableResult
    public func start(_ value: CGFloat) -> Flex {
        view.yoga.start = YGValue(value)
        return self
    }

    @discardableResult
    public func end(_ value: CGFloat) -> Flex {
        view.yoga.end = YGValue(value)
        return self
    }

    //
    // Width / height / height
    //
    @discardableResult
    public func width(_ value: CGFloat) -> Flex {
        view.yoga.width = YGValue(value)
        return self
    }
    
    @discardableResult
    public func height(_ value: CGFloat) -> Flex {
        view.yoga.height = YGValue(value)
        return self
    }
    
    @discardableResult
    public func size(_ size: CGSize) -> Flex {
        self.view.yoga.width = YGValue(size.width)
        self.view.yoga.height = YGValue(size.height)
        return self
    }
    
    @discardableResult
    public func size(_ sideLength: CGFloat) -> Flex{
        self.view.yoga.width = YGValue(sideLength)
        self.view.yoga.height = YGValue(sideLength)
        return self
    }

    @discardableResult
    public func minWidth(_ value: CGFloat) -> Flex {
        view.yoga.minWidth = YGValue(value)
        return self
    }

    @discardableResult
    public func minHeight(_ value: CGFloat) -> Flex {
        view.yoga.minHeight = YGValue(value)
        return self
    }

    @discardableResult
    public func maxWidth(_ value: CGFloat) -> Flex {
        view.yoga.maxWidth = YGValue(value)
        return self
    }

    @discardableResult
    public func maxHeight(_ value: CGFloat) -> Flex {
        view.yoga.maxHeight = YGValue(value)
        return self
    }

    @discardableResult
    public func aspectRatio(_ value: CGFloat) -> Flex {
        view.yoga.aspectRatio = value
        return self
    }
    
    @discardableResult
    public func aspectRatio(of imageView: UIImageView) -> Flex {
        if let imageSize = imageView.image?.size {
            view.yoga.aspectRatio = imageSize.width / imageSize.height
        }
        return self
    }
    
    //
    // Margins
    //
    @discardableResult
    public func marginTop(_ value: CGFloat) -> Flex {
        view.yoga.marginTop = YGValue(value)
        return self
    }
    
    @discardableResult
    public func marginLeft(_ value: CGFloat) -> Flex {
        view.yoga.marginLeft = YGValue(value)
        return self
    }

    @discardableResult
    public func marginStart(_ value: CGFloat) -> Flex {
        view.yoga.marginStart = YGValue(value)
        return self
    }
    
    @discardableResult
    public func marginBottom(_ value: CGFloat) -> Flex {
        view.yoga.marginBottom = YGValue(value)
        return self
    }
    
    @discardableResult
    public func marginRight(_ value: CGFloat) -> Flex {
        view.yoga.marginRight = YGValue(value)
        return self
    }

    @discardableResult
    public func marginEnd(_ value: CGFloat) -> Flex {
        view.yoga.marginEnd = YGValue(value)
        return self
    }
    
    @discardableResult
    public func marginHorizontal(_ value: CGFloat) -> Flex {
        view.yoga.marginHorizontal = YGValue(value)
        return self
    }
    
    @discardableResult
    public func marginVertical(_ value: CGFloat) -> Flex {
        view.yoga.marginVertical = YGValue(value)
        return self
    }

    @discardableResult
    public func margin(_ value: CGFloat) -> Flex {
        view.yoga.margin = YGValue(value)
        return self
    }
    
    @discardableResult func margin(_ vertical: CGFloat, _ horizontal: CGFloat) -> Flex {
        view.yoga.marginVertical = YGValue(vertical)
        view.yoga.marginHorizontal = YGValue(horizontal)
        return self
    }
    
    @discardableResult func margin(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> Flex {
        view.yoga.marginTop = YGValue(top)
        view.yoga.marginHorizontal = YGValue(horizontal)
        view.yoga.marginBottom = YGValue(bottom)
        return self
    }

    @discardableResult
    public func margin(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> Flex {
        view.yoga.marginTop = YGValue(top)
        view.yoga.marginLeft = YGValue(left)
        view.yoga.marginBottom = YGValue(bottom)
        view.yoga.marginRight = YGValue(right)
        return self
    }

    //
    // Padding
    //
    @discardableResult
    public func paddingTop(_ value: CGFloat) -> Flex {
        view.yoga.paddingTop = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingLeft(_ value: CGFloat) -> Flex {
        view.yoga.paddingLeft = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingBottom(_ value: CGFloat) -> Flex {
        view.yoga.paddingBottom = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingRight(_ value: CGFloat) -> Flex {
        view.yoga.paddingRight = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingStart(_ value: CGFloat) -> Flex {
        view.yoga.paddingStart = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingEnd(_ value: CGFloat) -> Flex {
        view.yoga.paddingEnd = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingHorizontal(_ value: CGFloat) -> Flex {
        view.yoga.paddingHorizontal = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingVertical(_ value: CGFloat) -> Flex {
        view.yoga.paddingVertical = YGValue(value)
        return self
    }

    @discardableResult
    public func padding(_ value: CGFloat) -> Flex {
        view.yoga.padding = YGValue(value)
        return self
    }

    @discardableResult func padding(_ vertical: CGFloat, _ horizontal: CGFloat) -> Flex {
        view.yoga.paddingVertical = YGValue(vertical)
        view.yoga.paddingHorizontal = YGValue(horizontal)
        return self
    }
    
    @discardableResult func padding(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> Flex {
        view.yoga.paddingTop = YGValue(top)
        view.yoga.paddingHorizontal = YGValue(horizontal)
        view.yoga.paddingBottom = YGValue(bottom)
        return self
    }
    
    @discardableResult
    public func padding(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> Flex {
        view.yoga.padding = YGValue(top)
        view.yoga.paddingLeft = YGValue(left)
        view.yoga.paddingBottom = YGValue(bottom)
        view.yoga.paddingRight = YGValue(right)
        return self
    }

    //
    // Border
    //
    @discardableResult
    public func borderLeft(_ value: CGFloat) -> Flex {
        view.yoga.borderLeftWidth = value
        return self
    }

    public func borderTop(_ value: CGFloat) -> Flex {
        view.yoga.borderTopWidth = value
        return self
    }

    public func borderRight(_ value: CGFloat) -> Flex {
        view.yoga.borderRightWidth = value
        return self
    }

    public func borderBottom(_ value: CGFloat) -> Flex {
        view.yoga.borderBottomWidth = value
        return self
    }

    public func borderStart(_ value: CGFloat) -> Flex {
        view.yoga.borderStartWidth = value
        return self
    }

    public func borderEnd(_ value: CGFloat) -> Flex {
        view.yoga.borderEndWidth = value
        return self
    }

    public func border(_ value: CGFloat) -> Flex {
        view.yoga.borderWidth = value
        return self
    }
    
    //
    // Visual properties
    //
    @discardableResult
    public func backgroundColor(_ color: UIColor) -> Flex {
        view.backgroundColor = color
        return self
    }
}

