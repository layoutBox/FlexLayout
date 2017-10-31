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

/**
 FlexLayout interface.
 
 The interface is accessible from any UIView class instance:
 ``` 
    label.flex.margin(10)
 ```
 */
public class Flex {
    
    //
    // MARK: Properties
    //

    /**
     Flex items's UIView.
    */
    public let view: UIView
    
    /**
     Item natural size, considering only properties of the view itself. Independent of the item frame.
     */
    public var intrinsicSize: CGSize {
        return view.yoga.intrinsicSize
    }
    
    init(view: UIView) {
        self.view = view
        // Enable flexbox and overwrite Yoga default values.
        view.yoga.isEnabled = true
    }

    //
    // MARK: Flex item addition and definition
    //
    
    /**
     This method adds a flex item (UIView) to a flex container. Internally the methods adds the UIView has subviews and enables flexbox.
    
     - Returns: The added view flex interface
     */
    @discardableResult
    public func addItem() -> Flex {
        let view = UIView()
        return addItem(view)
    }
    
    /**
     This method is similar to `addItem(: UIView)` except that it also creates the flex item's UIView. Internally the method creates an
     UIView, adds it has subviews and enables flexbox. This is useful to add a flex item/container easily when you don't need to refer to it later.
    
     - Parameter view: view to add to the flex container
     - Returns: The added view flex interface
     */
    @discardableResult
    public func addItem(_ view: UIView) -> Flex {
        self.view.addSubview(view)
        return view.flex
    }

    /**
     This method is used to structure your code so that it matches the flexbox structure. The method has a closure parameter with a
     single parameter called `flex`. This parameter is in fact, the view's flex interface, it can be used to adds other flex items
     and containers.
    
     - Parameter closure:
     - Returns: Flex interface
    */
    @discardableResult
    public func define(_ closure: (_ flex: Flex) -> Void) -> Flex {
        closure(self)
        return self
    }
    
    //
    // MARK: Layout / intrinsicSize / sizeThatFits
    //
    
    /**
     The method layout the flex container's children
    
     - Parameter mode: specify the layout mod (LayoutMode).
    */
    public func layout(mode: LayoutMode = .fitContainer) {
        if case .fitContainer = mode {
            view.yoga.applyLayout(preservingOrigin: true)
        } else {
            view.yoga.applyLayout(preservingOrigin: true, dimensionFlexibility: mode == .adjustWidth ? YGDimensionFlexibility.flexibleWidth : YGDimensionFlexibility.flexibleHeigth)
        }
    }
    
    /**
     This property controls dynamically if a flexbox's UIView is included or not in the flexbox layouting. When a
     flexbox's UIView is excluded, FlexLayout won't layout the view and its children views.
    */
    public var isIncludedInLayout: Bool = true {
        didSet {
            view.yoga.isIncludedInLayout = isIncludedInLayout
        }
    }
    
    /**
     This method controls dynamically if a flexbox's UIView is included or not in the flexbox layouting. When a
     flexbox's UIView is excluded, FlexLayout won't layout the view and its children views.
    
     - Parameter included: true to layout the view
     - Returns:
     */
    @discardableResult
    public func isIncludedInLayout(_ included: Bool) -> Flex {
        self.isIncludedInLayout = included
        return self
    }

    /**
     The framework is so highly optimized, that flex item are layouted only when a flex property is changed and when flex container
     size change. In the event that you want to force FlexLayout to do a layout of a flex item, you can mark it as dirty 
     using `markDirty()`.
     
     Dirty flag propagates to the root of the flexbox tree ensuring that when any item is invalidated its whole subtree will be re-calculated
    
     - Returns: Flex interface
    */
    @discardableResult
    public func markDirty() -> Flex {
        view.yoga.markDirty()
        return self
    }
    
    /**
     Returns the item size when layouted in the specified frame size
    
     - Parameter size: frame size
     - Returns: item size
    */
    public func sizeThatFits(size: CGSize) -> CGSize {
        return view.yoga.calculateLayout(with: size)
    }
    
    //
    // MARK: Direction, wrap, flow
    //
    
    /**
     The `direction` property establishes the main-axis, thus defining the direction flex items are placed in the flex container.
    
     The `direction` property specifies how flex items are laid out in the flex container, by setting the direction of the flex 
     container’s main axis. They can be laid out in two main directions,  like columns vertically or like rows horizontally.
    
     Note that row and row-reverse are affected by the layout direction (see `layoutDirection` property) of the flex container. 
     If its text direction is LTR (left to right), row represents the horizontal axis oriented from left to right, and row-reverse 
     from right to left; if the direction is rtl, it's the opposite.
    
     - Parameter value: Default value is .column
    */
    @discardableResult
    public func direction(_ value: Direction) -> Flex {
        view.yoga.flexDirection = value.yogaValue
        return self
    }
    
    /**
     The `wrap` property controls whether the flex container is single-lined or multi-lined, and the direction of the cross-axis, which determines the direction in which the new lines are stacked in.
    
     - Parameter value: Default value is .noWrap
    */
    @discardableResult
    public func wrap(_ value: Wrap) -> Flex {
        view.yoga.flexWrap = value.yogaValue
        return self
    }
    
    /**
     Direction defaults to Inherit on all nodes except the root which defaults to LTR. It is up to you to detect the 
     user’s preferred direction (most platforms have a standard way of doing this) and setting this direction on the 
     root of your layout tree.
    
     - Parameter value: new LayoutDirection
     - Returns:
    */
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
    // MARK: justity, alignment, position
    //
    
    /**
     The `justifyContent` property defines the alignment along the main-axis of the current line of the flex container. 
     It helps distribute extra free space leftover when either all the flex items on a line have reached their maximum 
     size. For example, if children are flowing vertically, `justifyContent` controls how they align vertically.
    
     - Parameter value: Default value is .start
    */
    @discardableResult
    public func justifyContent(_ value: JustifyContent) -> Flex {
        view.yoga.justifyContent = value.yogaValue
        return self
    }
    
    /**
     The `alignItems` property defines how flex items are laid out along the cross axis on the current line.
     Similar to `justifyContent` but for the cross-axis (perpendicular to the main-axis). For example, if
     children are flowing vertically, `alignItems` controls how they align horizontally.
     
     - Parameter value: Default value is .stretch
     */
    @discardableResult
    public func alignItems(_ value: AlignItems) -> Flex {
        view.yoga.alignItems = value.yogaValue
        return self
    }
    
    /**
     The `alignSelf` property controls how a child aligns in the cross direction, overriding the `alignItems`
     of the parent. For example, if children are flowing vertically, `alignSelf` will control how the flex item 
     will align horizontally.
    
     - Parameter value: Default value is .auto
    */
    @discardableResult
    public func alignSelf(_ value: AlignSelf) -> Flex {
        view.yoga.alignSelf = value.yogaValue
        return self
    }
    
    /**
     The align-content property aligns a flex container’s lines within the flex container when there is extra space
     in the cross-axis, similar to how justifyContent aligns individual items within the main-axis.
     
     - Parameter value: Default value is .start
     */
    @discardableResult
    public func alignContent(_ value: AlignContent) -> Flex {
        view.yoga.alignContent = value.yogaValue
        return self
    }

    /*@discardableResult
    public func overflow(_ value: Overflow) -> Flex {
        view.yoga.overflow = value.yogaValue
        return self
    }*/
    
    //
    // MARK: grow / shrink / basis
    //
    
    /**
     The `grow` property defines the ability for a flex item to grow if necessary. It accepts a unitless value 
     that serves as a proportion. It dictates what amount of the available space inside the flex container the 
     item should take up.
    
     - Parameter value: Default value is 0
    */
    @discardableResult
    public func grow(_ value: CGFloat) -> Flex {
        view.yoga.flexGrow = value
       return self
    }
    
    /**
     It specifies the "flex shrink factor", which determines how much the flex item will shrink relative to the 
     rest of the flex items in the flex container when there isn't enough space on the main-axis.
    
     When omitted, it is set to 0 and the flex shrink factor is multiplied by the flex `basis` when distributing 
     negative space.
    
     A shrink value of 0 keeps the view's size in the main-axis direction. Note that this may cause the view to 
     overflow its flex container.
    
     - Parameter value: Default value is 1
    */
    @discardableResult
    public func shrink(_ value: CGFloat) -> Flex {
        view.yoga.flexShrink = value
        return self
    }

    /**
     This property takes the same values as the width and height properties, and specifies the initial size of the
     flex item, before free space is distributed according to the grow and shrink factors.
    
     Specifying `nil` set the basis as `auto`, which means the length is equal to the length of the item. If the 
     item has no length specified, the length will be according to its content.
    
     - Parameter value: Default value is 0
    */
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
    // MARK: Width / height / height
    //
    
    /** 
     The value specifies the view's width in pixels. The value must be non-negative.
    */
    @discardableResult
    public func width(_ value: CGFloat) -> Flex {
        view.yoga.width = YGValue(value)
        return self
    }
    
    /**
     The value specifies the view's width in percentage of its container width. The value must be non-negative.
     Example: view.flex.width(20%)
     */
    @discardableResult
    public func width(_ percent: FPercent) -> Flex {
        view.yoga.width = YGValue(value: Float(percent.value), unit: .percent)
        return self
    }
    
    /**
     The value specifies the view's height in pixels. The value must be non-negative.
     */
    @discardableResult
    public func height(_ value: CGFloat) -> Flex {
        view.yoga.height = YGValue(value)
        return self
    }
    
    /**
     The value specifies the view's height in percentage of its container height. The value must be non-negative.
     Example: view.flex.height(40%)
     */
    @discardableResult
    public func height(_ percent: FPercent) -> Flex {
        view.yoga.height = YGValue(value: Float(percent.value), unit: .percent)
        return self
    }
    
    /**
     The value specifies view's width and the height in pixels. Values must be non-negative.
     */
    @discardableResult
    public func size(_ size: CGSize) -> Flex {
        self.view.yoga.width = YGValue(size.width)
        self.view.yoga.height = YGValue(size.height)
        return self
    }
    
    /**
     The value specifies the width and the height of the view in pixels, creating a square view. Values must be non-negative.
     */
    @discardableResult
    public func size(_ sideLength: CGFloat) -> Flex {
        self.view.yoga.width = YGValue(sideLength)
        self.view.yoga.height = YGValue(sideLength)
        return self
    }

    /**
     The value specifies the view's minimum width in pixels. The value must be non-negative.
     */
    @discardableResult
    public func minWidth(_ value: CGFloat) -> Flex {
        view.yoga.minWidth = YGValue(value)
        return self
    }
    
    /**
     The value specifies the view's minimum width in percentage of its container width. The value must be non-negative.
     */
    @discardableResult
    public func minWidth(_ percent: FPercent) -> Flex {
        view.yoga.minWidth = YGValue(value: Float(percent.value), unit: .percent)
        return self
    }

    /**
     The value specifies the view's maximum width in pixels. The value must be non-negative.
     */
    @discardableResult
    public func maxWidth(_ value: CGFloat) -> Flex {
        view.yoga.maxWidth = YGValue(value)
        return self
    }
    
    /**
     The value specifies the view's maximum width in percentage of its container width. The value must be non-negative.
     */
    @discardableResult
    public func maxWidth(_ percent: FPercent) -> Flex {
        view.yoga.maxWidth = YGValue(value: Float(percent.value), unit: .percent)
        return self
    }
    
    /**
     The value specifies the view's minimum height in pixels. The value must be non-negative.
     */
    @discardableResult
    public func minHeight(_ value: CGFloat) -> Flex {
        view.yoga.minHeight = YGValue(value)
        return self
    }
    
    /**
     The value specifies the view's minimum height in percentage of its container height. The value must be non-negative.
     */
    @discardableResult
    public func minHeight(_ percent: FPercent) -> Flex {
        view.yoga.minHeight = YGValue(value: Float(percent.value), unit: .percent)
        return self
    }

    /**
     The value specifies the view's maximum height in pixels. The value must be non-negative.
     */
    @discardableResult
    public func maxHeight(_ value: CGFloat) -> Flex {
        view.yoga.maxHeight = YGValue(value)
        return self
    }
    
    /**
     The value specifies the view's maximum height in percentage of its container height. The value must be non-negative.
     */
    @discardableResult
    public func maxHeight(_ percent: FPercent) -> Flex {
        view.yoga.maxHeight = YGValue(value: Float(percent.value), unit: .percent)
        return self
    }
    
    /**
     AspectRatio is a property introduced by Yoga that don't exist in CSS. AspectRatio solves the problem of knowing 
     one dimension of an element and an aspect ratio, this is very common when it comes to images, videos, and other
     media types. AspectRatio accepts any floating point value > 0, the default is undefined.
    
     - Parameter value:
     - Returns:
    */
    @discardableResult
    public func aspectRatio(_ value: CGFloat) -> Flex {
        view.yoga.aspectRatio = value
        return self
    }
    
    /**
     AspectRatio is a property introduced by Yoga that don't exist in CSS. AspectRatio solves the problem of knowing
     one dimension of an element and an aspect ratio, this is very common when it comes to images, videos, and other
     media types. AspectRatio accepts any floating point value > 0, the default is undefined.
    
     - Parameter value:
     - Returns:
    */
    @discardableResult
    public func aspectRatio(of imageView: UIImageView) -> Flex {
        if let imageSize = imageView.image?.size {
            view.yoga.aspectRatio = imageSize.width / imageSize.height
        }
        return self
    }
    
    //
    // MARK: Absolute positionning
    //
    
    /**
     The position property tells Flexbox how you want your item to be positioned within its parent.
     
     - Parameter value: Default value is .relative
     */
    @discardableResult
    public func position(_ value: Position) -> Flex {
        view.yoga.position = value.yogaValue
        return self
    }
    
    /**
     Set the left edge distance from the container left edge in pixels.
     */
    @discardableResult
    public func left(_ value: CGFloat) -> Flex {
        view.yoga.left = YGValue(value)
        return self
    }
    
    /**
     Set the top edge distance from the container top edge in pixels.
     */
    @discardableResult
    public func top(_ value: CGFloat) -> Flex {
        view.yoga.top = YGValue(value)
        return self
    }
    
    /**
     Set the right edge distance from the container right edge in pixels.
     */
    @discardableResult
    public func right(_ value: CGFloat) -> Flex {
        view.yoga.right = YGValue(value)
        return self
    }
    
    /**
     Set the bottom edge distance from the container bottom edge in pixels.
     */
    @discardableResult
    public func bottom(_ value: CGFloat) -> Flex {
        view.yoga.bottom = YGValue(value)
        return self
    }
    
    /**
     Set the start edge (LTR=left, RTL=right) distance from the container start edge in pixels.
     */
    @discardableResult
    public func start(_ value: CGFloat) -> Flex {
        view.yoga.start = YGValue(value)
        return self
    }
    
    /**
     Set the end edge (LTR=right, RTL=left) distance from the container start edge in pixels.
     */
    @discardableResult
    public func end(_ value: CGFloat) -> Flex {
        view.yoga.end = YGValue(value)
        return self
    }
    
    //
    // MARK: Margins
    //
    
    /**
     Set the top margin. Top margin specify the offset the top edge of the item should have from from it’s closest sibling (item) or parent (container).
     */
    @discardableResult
    public func marginTop(_ value: CGFloat) -> Flex {
        view.yoga.marginTop = YGValue(value)
        return self
    }
    
    /**
     Set the left margin. Left margin specify the offset the left edge of the item should have from from it’s closest sibling (item) or parent (container).
     */
    @discardableResult
    public func marginLeft(_ value: CGFloat) -> Flex {
        view.yoga.marginLeft = YGValue(value)
        return self
    }

    /**
     Set the bottom margin. Bottom margin specify the offset the bottom edge of the item should have from from it’s closest sibling (item) or parent (container).
     */
    @discardableResult
    public func marginBottom(_ value: CGFloat) -> Flex {
        view.yoga.marginBottom = YGValue(value)
        return self
    }
    
    /**
     Set the right margin. Right margin specify the offset the right edge of the item should have from from it’s closest sibling (item) or parent (container).
     */
    @discardableResult
    public func marginRight(_ value: CGFloat) -> Flex {
        view.yoga.marginRight = YGValue(value)
        return self
    }

    /**
     Set the start margin.
     
     Depends on the item `LayoutDirection`:
     * In LTR direction, start margin specify the offset the **left** edge of the item should have from from it’s closest sibling (item) or parent (container).
     * IN RTL direction, start margin specify the offset the **right** edge of the item should have from from it’s closest sibling (item) or parent (container).
     */
    @discardableResult
    public func marginStart(_ value: CGFloat) -> Flex {
        view.yoga.marginStart = YGValue(value)
        return self
    }
    
    /**
     Set the end margin.
     
     Depends on the item `LayoutDirection`:
     * In LTR direction, end margin specify the offset the **right** edge of the item should have from from it’s closest sibling (item) or parent (container).
     * IN RTL direction, end margin specify the offset the **left** edge of the item should have from from it’s closest sibling (item) or parent (container).
     */
    @discardableResult
    public func marginEnd(_ value: CGFloat) -> Flex {
        view.yoga.marginEnd = YGValue(value)
        return self
    }
    
    /**
     Set the left, right, start and end margins to the specified value.
     */
    @discardableResult
    public func marginHorizontal(_ value: CGFloat) -> Flex {
        view.yoga.marginHorizontal = YGValue(value)
        return self
    }
    
    /**
     Set the top and bottom margins to the specified value.
     */
    @discardableResult
    public func marginVertical(_ value: CGFloat) -> Flex {
        view.yoga.marginVertical = YGValue(value)
        return self
    }
    
    /**
     Set all margins using UIEdgeInsets.
     This method is particularly useful to set all margins using iOS 11 `UIView.safeAreaInsets`.
     */
    @discardableResult
    public func margin(_ insets: UIEdgeInsets) -> Flex {
        view.yoga.marginTop = YGValue(insets.top)
        view.yoga.marginLeft = YGValue(insets.left)
        view.yoga.marginBottom = YGValue(insets.bottom)
        view.yoga.marginRight = YGValue(insets.right)
        return self
    }
    
    /**
     Set margins using NSDirectionalEdgeInsets.
     This method is particularly to set all margins using iOS 11 `UIView.directionalLayoutMargins`.
     
     Available only on iOS 11 and higher.
     */
    @available(tvOS 11.0, iOS 11.0, *)
    @discardableResult
    func margin(_ directionalInsets: NSDirectionalEdgeInsets) -> Flex {
        view.yoga.marginTop = YGValue(directionalInsets.top)
        view.yoga.marginStart = YGValue(directionalInsets.leading)
        view.yoga.marginBottom = YGValue(directionalInsets.bottom)
        view.yoga.marginEnd = YGValue(directionalInsets.trailing)
        return self
    }

    /**
     Set all margins to the specified value.
     */
    @discardableResult
    public func margin(_ value: CGFloat) -> Flex {
        view.yoga.margin = YGValue(value)
        return self
    }
    
    /**
     Set the individually vertical margins (top, bottom) and horizontal margins (left, right, start, end).
     */
    @discardableResult func margin(_ vertical: CGFloat, _ horizontal: CGFloat) -> Flex {
        view.yoga.marginVertical = YGValue(vertical)
        view.yoga.marginHorizontal = YGValue(horizontal)
        return self
    }
    
    /**
     Set the individually top, horizontal margins and bottom margin.
     */
    @discardableResult func margin(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> Flex {
        view.yoga.marginTop = YGValue(top)
        view.yoga.marginHorizontal = YGValue(horizontal)
        view.yoga.marginBottom = YGValue(bottom)
        return self
    }

    /**
     Set the individually top, left, bottom and right margins.
     */
    @discardableResult
    public func margin(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> Flex {
        view.yoga.marginTop = YGValue(top)
        view.yoga.marginLeft = YGValue(left)
        view.yoga.marginBottom = YGValue(bottom)
        view.yoga.marginRight = YGValue(right)
        return self
    }

    //
    // MARK: Padding
    //
    
    /**
     Set the top padding. Top padding specify the **offset children should have** from the container's top edge.
     */
    @discardableResult
    public func paddingTop(_ value: CGFloat) -> Flex {
        view.yoga.paddingTop = YGValue(value)
        return self
    }

    /**
     Set the left padding. Left padding specify the **offset children should have** from the container's left edge.
     */
    @discardableResult
    public func paddingLeft(_ value: CGFloat) -> Flex {
        view.yoga.paddingLeft = YGValue(value)
        return self
    }

    /**
     Set the bottom padding. Bottom padding specify the **offset children should have** from the container's bottom edge.
     */
    @discardableResult
    public func paddingBottom(_ value: CGFloat) -> Flex {
        view.yoga.paddingBottom = YGValue(value)
        return self
    }

    /**
     Set the top padding. Top padding specify the **offset children should have** from the container's top edge.
     */
    @discardableResult
    public func paddingRight(_ value: CGFloat) -> Flex {
        view.yoga.paddingRight = YGValue(value)
        return self
    }

    /**
     Set the start padding.
     
     Depends on the item `LayoutDirection`:
     * In LTR direction, start padding specify the **offset children should have** from the container's left edge.
     * IN RTL direction, start padding specify the **offset children should have** from the container's right edge.
     */
    @discardableResult
    public func paddingStart(_ value: CGFloat) -> Flex {
        view.yoga.paddingStart = YGValue(value)
        return self
    }

    /**
     Set the end padding.
     
     Depends on the item `LayoutDirection`:
     * In LTR direction, end padding specify the **offset children should have** from the container's right edge.
     * IN RTL direction, end padding specify the **offset children should have** from the container's left edge.
     */
    @discardableResult
    public func paddingEnd(_ value: CGFloat) -> Flex {
        view.yoga.paddingEnd = YGValue(value)
        return self
    }

    /**
     Set the left, right, start and end paddings to the specified value.
     */
    @discardableResult
    public func paddingHorizontal(_ value: CGFloat) -> Flex {
        view.yoga.paddingHorizontal = YGValue(value)
        return self
    }

    /**
     Set the top and bottom paddings to the specified value.
     */
    @discardableResult
    public func paddingVertical(_ value: CGFloat) -> Flex {
        view.yoga.paddingVertical = YGValue(value)
        return self
    }
    
    /**
     Set paddings using UIEdgeInsets.
     This method is particularly useful to set all paddings using iOS 11 `UIView.safeAreaInsets`.
     */
    @discardableResult
    public func padding(_ insets: UIEdgeInsets) -> Flex {
        view.yoga.paddingTop = YGValue(insets.top)
        view.yoga.paddingLeft = YGValue(insets.left)
        view.yoga.paddingBottom = YGValue(insets.bottom)
        view.yoga.paddingRight = YGValue(insets.right)
        return self
    }
    
    /**
     Set paddings using NSDirectionalEdgeInsets.
     This method is particularly to set all paddings using iOS 11 `UIView.directionalLayoutMargins`.
     
     Available only on iOS 11 and higher.
     */
    @available(tvOS 11.0, iOS 11.0, *)
    @discardableResult
    func padding(_ directionalInsets: NSDirectionalEdgeInsets) -> Flex {
        view.yoga.paddingTop = YGValue(directionalInsets.top)
        view.yoga.paddingStart = YGValue(directionalInsets.leading)
        view.yoga.paddingBottom = YGValue(directionalInsets.bottom)
        view.yoga.paddingEnd = YGValue(directionalInsets.trailing)
        return self
    }


    /**
     Set all paddings to the specified value.
     */
    @discardableResult
    public func padding(_ value: CGFloat) -> Flex {
        view.yoga.padding = YGValue(value)
        return self
    }

    /**
     Set the individually vertical paddings (top, bottom) and horizontal paddings (left, right, start, end).
     */
    @discardableResult func padding(_ vertical: CGFloat, _ horizontal: CGFloat) -> Flex {
        view.yoga.paddingVertical = YGValue(vertical)
        view.yoga.paddingHorizontal = YGValue(horizontal)
        return self
    }
    
    /**
     Set the individually top, horizontal paddings and bottom padding.
     */
    @discardableResult func padding(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> Flex {
        view.yoga.paddingTop = YGValue(top)
        view.yoga.paddingHorizontal = YGValue(horizontal)
        view.yoga.paddingBottom = YGValue(bottom)
        return self
    }
    
    /**
     Set the individually top, left, bottom and right paddings.
     */
    @discardableResult
    public func padding(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> Flex {
        view.yoga.padding = YGValue(top)
        view.yoga.paddingLeft = YGValue(left)
        view.yoga.paddingBottom = YGValue(bottom)
        view.yoga.paddingRight = YGValue(right)
        return self
    }
    
    //
    // MARK: UIView Visual properties
    //

    /**
     Set the view background color.
    
     - Parameter color: new color
     - Returns: flex interface
    */
    @discardableResult
    public func backgroundColor(_ color: UIColor) -> Flex {
        view.backgroundColor = color
        return self
    }
    
    // MARK: Enums
    
    /**
     */
    public enum Direction {
        /// Default value. The flexible items are displayed vertically, as a column.
        case column
        /// Same as column, but in reverse order
        case columnReverse
        /// The flexible items are displayed horizontally, as a row.
        case row
        /// Same as row, but in reverse order
        case rowReverse
    }
    
    /**
     */
    public enum JustifyContent {
        /// Default value. Items are positioned at the beginning of the container.
        case start
        /// Items are positioned at the center of the container
        case center
        /// Items are positioned at the end of the container
        case end
        /// Items are positioned with space between the lines
        case spaceBetween
        /// Items are positioned with space before, between, and after the lines
        case spaceAround
    }
    
    /**
     */
    public enum AlignContent {
        /// Default value. Lines stretch to take up the remaining space
        case stretch
        /// Lines are packed toward the start of the flex container
        case start
        /// Lines are packed toward the center of the flex container
        case center
        /// Lines are packed toward the end of the flex container
        case end
        /// Lines are evenly distributed in the flex container
        case spaceBetween
        /// Lines are evenly distributed in the flex container, with half-size spaces on either end	Play it »
        case spaceAround
    }
    
    /**
     */
    public enum AlignItems {
        /// Default. Items are stretched to fit the container
        case stretch
        /// Items are positioned at the beginning of the container
        case start
        /// Items are positioned at the center of the container
        case center
        /// Items are positioned at the end of the container
        case end
        /// Items are positioned at the baseline of the container
        case baseline
    }
    
    /**
     */
    public enum AlignSelf {
        /// Default. The element inherits its parent container's align-items property, or "stretch" if it has no parent container
        case auto
        /// The element is positioned to fit the container
        case stretch
        /// The element is positioned at the beginning of the container
        case start
        /// The element is positioned at the center of the container
        case center
        /// The element is positioned at the end of the container
        case end
        /// The element is positioned at the baseline of the container
        case baseline
    }
    
    /**
     */
    public enum Wrap {
        /// Default value. Specifies that the flexible items will not wrap
        case noWrap
        /// Specifies that the flexible items will wrap if necessary
        case wrap
        /// Specifies that the flexible items will wrap, if necessary, in reverse order
        case wrapReverse
    }
    
    /**
     */
    public enum Position {
        /// Default value.
        case relative
        /// Positioned absolutely in regards to its container. The item is positionned using properties top, bottom, left, right, start, end.
        case absolute
    }
    
    /**
     */
    public enum LayoutDirection {
        /// Default value.
        case inherit
        /// Left to right layout direction
        case ltr
        /// Right to right layout direction
        case rtl
        //case auto       // Detected automatically
    }
    
    /**
     Defines how the `layout(mode:)` method layout its flex items.
     */
    public enum LayoutMode {
        /// This is the default mode when no parameter is specified. Children are layouted **inside** the container's size (width and height).
        case fitContainer
        /// In this mode, children are layouted **using only the container's width**. The container's height will be adjusted to fit the flexbox's children
        case adjustHeight
        /// In this mode, children are layouted **using only the container's height**. The container's width will be adjusted to fit the flexbox's children
        case adjustWidth
    }
    
    /*public enum Overflow {
     /// Items that overflow
        case visible
        case hidden
        case scroll
    }*/
}
