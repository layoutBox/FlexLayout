//
//  FlexLayout.swift
//
//  Created by DION, Luc (MTL) on 2017-03-04.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit
import YogaKit

public class FlexLayout {
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
        //case spaceBetween ?
        //case spaceAround ?
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
        case auto       // Detected automatically
        case LTR        // Left to right
        case RTL        // Right to right
    }

    init(view: UIView) {
        self.view = view
        // Enable flexbox and overwrite Yoga default values.
        view.yoga.isEnabled = true
        view.yoga.flexShrink = 1
    }

    public var intrinsicSize: CGSize {
        return view.yoga.intrinsicSize
    }
    
    
    //
    // Creation / definition
    //
    @discardableResult
    public func addContainer() -> FlexLayout {
        let view = FlexView()
        return addItem(view)
    }
    
    @discardableResult
    public func addItem(_ view: UIView) -> FlexLayout {
        self.view.addSubview(view)
        return view.flexbox
    }

    @discardableResult
    public func define(_ closure: (_ FlexLayoutContainer: FlexLayout) -> Void) -> FlexLayout {
        closure(self)
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
    public func isIncludedInLayout(_ included: Bool) -> FlexLayout {
        self.isIncludedInLayout = included
        return self
    }

    public func sizeThatFits(size: CGSize) -> CGSize {
        return view.yoga.calculateLayout(with: size)
    }
    
    //
    // direction, wrap, flow
    //
    @discardableResult
    public func direction(_ value: Direction) -> FlexLayout {
        view.yoga.flexDirection = value.yogaValue
        return self
    }
    
    @discardableResult
    public func wrap(_ value: Wrap) -> FlexLayout {
        view.yoga.flexWrap = value.yogaValue
        return self
    }
    
    @discardableResult
    public func layoutDirection(_ value: LayoutDirection) -> FlexLayout {
        switch value {
        case .auto:
            let userInterfaceLayoutDirection: UIUserInterfaceLayoutDirection
            if #available(iOS 9.0, *) {
                userInterfaceLayoutDirection = UIView.userInterfaceLayoutDirection(for: view.semanticContentAttribute)
            } else {
                userInterfaceLayoutDirection = UIApplication.shared.userInterfaceLayoutDirection
            }
            view.yoga.direction = userInterfaceLayoutDirection == UIUserInterfaceLayoutDirection.leftToRight ? YGDirection.LTR : YGDirection.RTL
            
        default:
            view.yoga.direction = value.yogaValue
        }
        return self
    }
    
    //
    // justity, alignment / position
    //
    @discardableResult
    public func justifyContent(_ value: Justify) -> FlexLayout {
        view.yoga.justifyContent = value.yogaValue
        return self
    }
    
    @discardableResult
    public func alignContent(_ value: Align) -> FlexLayout {
        view.yoga.alignContent = value.yogaValue
        return self
    }
    
    @discardableResult
    public func alignSelf(_ value: Align) -> FlexLayout {
        view.yoga.alignSelf = value.yogaValue
        return self
    }

    @discardableResult
    public func alignItems(_ value: Align) -> FlexLayout {
        view.yoga.alignItems = value.yogaValue
        return self
    }
    
    @discardableResult
    public func position(_ value: Position) -> FlexLayout {
        view.yoga.position = value.yogaValue
        return self
    }

    @discardableResult
    public func overflow(_ value: Overflow) -> FlexLayout {
        view.yoga.overflow = value.yogaValue
        return self
    }
    
    //
    // grow / shrink / basis
    //
    @discardableResult
    public func grow(_ value: CGFloat) -> FlexLayout {
        view.yoga.flexGrow = value
       return self
    }
    
    @discardableResult
    public func shrink(_ value: CGFloat) -> FlexLayout {
        view.yoga.flexShrink = value
        return self
    }

    @discardableResult
    public func basis(_ value: CGFloat?) -> FlexLayout {
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
    public func left(_ value: CGFloat) -> FlexLayout {
        view.yoga.left = YGValue(value)
        return self
    }

    @discardableResult
    public func top(_ value: CGFloat) -> FlexLayout {
        view.yoga.top = YGValue(value)
        return self
    }

    @discardableResult
    public func right(_ value: CGFloat) -> FlexLayout {
        view.yoga.right = YGValue(value)
        return self
    }

    @discardableResult
    public func bottom(_ value: CGFloat) -> FlexLayout {
        view.yoga.bottom = YGValue(value)
        return self
    }

    @discardableResult
    public func start(_ value: CGFloat) -> FlexLayout {
        view.yoga.start = YGValue(value)
        return self
    }

    @discardableResult
    public func end(_ value: CGFloat) -> FlexLayout {
        view.yoga.end = YGValue(value)
        return self
    }

    //
    // Width / height / height
    //
    @discardableResult
    public func width(_ value: CGFloat) -> FlexLayout {
        view.yoga.width = YGValue(value)
        return self
    }
    
    @discardableResult
    public func height(_ value: CGFloat) -> FlexLayout {
        view.yoga.height = YGValue(value)
        return self
    }
    
    @discardableResult
    public func size(_ size: CGSize) -> FlexLayout {
        self.view.yoga.width = YGValue(size.width)
        self.view.yoga.height = YGValue(size.height)
        return self
    }
    
    @discardableResult
    public func size(_ sideLength: CGFloat) -> FlexLayout{
        self.view.yoga.width = YGValue(sideLength)
        self.view.yoga.height = YGValue(sideLength)
        return self
    }

    @discardableResult
    public func minWidth(_ value: CGFloat) -> FlexLayout {
        view.yoga.minWidth = YGValue(value)
        return self
    }

    @discardableResult
    public func minHeight(_ value: CGFloat) -> FlexLayout {
        view.yoga.minHeight = YGValue(value)
        return self
    }

    @discardableResult
    public func maxWidth(_ value: CGFloat) -> FlexLayout {
        view.yoga.maxWidth = YGValue(value)
        return self
    }

    @discardableResult
    public func maxHeight(_ value: CGFloat) -> FlexLayout {
        view.yoga.maxHeight = YGValue(value)
        return self
    }

    @discardableResult
    public func aspectRatio(_ value: CGFloat) -> FlexLayout {
        view.yoga.aspectRatio = value
        return self
    }
    
    @discardableResult
    public func aspectRatio(of imageView: UIImageView) -> FlexLayout {
        if let imageSize = imageView.image?.size {
            view.yoga.aspectRatio = imageSize.width / imageSize.height
        }
        return self
    }
    
    //
    // Margins
    //
    @discardableResult
    public func marginTop(_ value: CGFloat) -> FlexLayout {
        view.yoga.marginTop = YGValue(value)
        return self
    }
    
    @discardableResult
    public func marginLeft(_ value: CGFloat) -> FlexLayout {
        view.yoga.marginLeft = YGValue(value)
        return self
    }

    @discardableResult
    public func marginStart(_ value: CGFloat) -> FlexLayout {
        view.yoga.marginStart = YGValue(value)
        return self
    }
    
    @discardableResult
    public func marginBottom(_ value: CGFloat) -> FlexLayout {
        view.yoga.marginBottom = YGValue(value)
        return self
    }
    
    @discardableResult
    public func marginRight(_ value: CGFloat) -> FlexLayout {
        view.yoga.marginRight = YGValue(value)
        return self
    }

    @discardableResult
    public func marginEnd(_ value: CGFloat) -> FlexLayout {
        view.yoga.marginEnd = YGValue(value)
        return self
    }
    
    @discardableResult
    public func marginHorizontal(_ value: CGFloat) -> FlexLayout {
        view.yoga.marginHorizontal = YGValue(value)
        return self
    }
    
    @discardableResult
    public func marginVertical(_ value: CGFloat) -> FlexLayout {
        view.yoga.marginVertical = YGValue(value)
        return self
    }

    @discardableResult
    public func margin(_ value: CGFloat) -> FlexLayout {
        view.yoga.margin = YGValue(value)
        return self
    }
    
    @discardableResult func margin(_ vertical: CGFloat, _ horizontal: CGFloat) -> FlexLayout {
        view.yoga.marginVertical = YGValue(vertical)
        view.yoga.marginHorizontal = YGValue(horizontal)
        return self
    }
    
    @discardableResult func margin(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> FlexLayout {
        view.yoga.marginTop = YGValue(top)
        view.yoga.marginHorizontal = YGValue(horizontal)
        view.yoga.marginBottom = YGValue(bottom)
        return self
    }

    @discardableResult
    public func margin(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> FlexLayout {
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
    public func paddingTop(_ value: CGFloat) -> FlexLayout {
        view.yoga.paddingTop = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingLeft(_ value: CGFloat) -> FlexLayout {
        view.yoga.paddingLeft = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingBottom(_ value: CGFloat) -> FlexLayout {
        view.yoga.paddingBottom = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingRight(_ value: CGFloat) -> FlexLayout {
        view.yoga.paddingRight = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingStart(_ value: CGFloat) -> FlexLayout {
        view.yoga.paddingStart = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingEnd(_ value: CGFloat) -> FlexLayout {
        view.yoga.paddingEnd = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingHorizontal(_ value: CGFloat) -> FlexLayout {
        view.yoga.paddingHorizontal = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingVertical(_ value: CGFloat) -> FlexLayout {
        view.yoga.paddingVertical = YGValue(value)
        return self
    }

    @discardableResult
    public func padding(_ value: CGFloat) -> FlexLayout {
        view.yoga.padding = YGValue(value)
        return self
    }

    @discardableResult func padding(_ vertical: CGFloat, _ horizontal: CGFloat) -> FlexLayout {
        view.yoga.paddingVertical = YGValue(vertical)
        view.yoga.paddingHorizontal = YGValue(horizontal)
        return self
    }
    
    @discardableResult func padding(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> FlexLayout {
        view.yoga.paddingTop = YGValue(top)
        view.yoga.paddingHorizontal = YGValue(horizontal)
        view.yoga.paddingBottom = YGValue(bottom)
        return self
    }
    
    @discardableResult
    public func padding(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> FlexLayout {
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
    public func borderLeft(_ value: CGFloat) -> FlexLayout {
        view.yoga.borderLeftWidth = value
        return self
    }

    public func borderTop(_ value: CGFloat) -> FlexLayout {
        view.yoga.borderTopWidth = value
        return self
    }

    public func borderRight(_ value: CGFloat) -> FlexLayout {
        view.yoga.borderRightWidth = value
        return self
    }

    public func borderBottom(_ value: CGFloat) -> FlexLayout {
        view.yoga.borderBottomWidth = value
        return self
    }

    public func borderStart(_ value: CGFloat) -> FlexLayout {
        view.yoga.borderStartWidth = value
        return self
    }

    public func borderEnd(_ value: CGFloat) -> FlexLayout {
        view.yoga.borderEndWidth = value
        return self
    }

    public func border(_ value: CGFloat) -> FlexLayout {
        view.yoga.borderWidth = value
        return self
    }
}

