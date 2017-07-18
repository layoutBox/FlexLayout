//
//  Flexbox.swift
//
//  Created by DION, Luc (MTL) on 2017-03-04.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit
import YogaKit

public class Flexbox {
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
        case flexStart
        case flexEnd
        case center
        case spaceBetween
        case spaceAround
    }

    public enum Align {
        //case auto
        case flexStart
        case flexEnd
        case center
        case stretch
        case baseline
        //case spaceBetween
        //case spaceAround
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

    init(view: UIView) {
        self.view = view
        view.yoga.isEnabled = true
    }

    public var intrinsicSize: CGSize {
        return view.yoga.intrinsicSize
    }
    
    public var isIncludedInLayout: Bool = true {
        didSet {
            view.yoga.isIncludedInLayout = isIncludedInLayout
        }
    }

    @discardableResult
    public func isIncludedInLayout(_ included: Bool) -> Flexbox {
        self.isIncludedInLayout = included
        return self
    }

    //
    // Creation / definition
    //
    @discardableResult
    public func createBox() -> Flexbox {
        let view = UIView()
        return addChild(view)
    }
    
    @discardableResult
    public func addChild(_ view: UIView) -> Flexbox {
        self.view.addSubview(view)
        return view.flexbox
    }

    @discardableResult
    public func define(_ closure: (_ flexboxContainer: Flexbox) -> Void) -> Flexbox {
        closure(self)
        return self
    }

    //
    // Layout
    //
    public func layout(preservingOrigin: Bool = true) {
        view.yoga.applyLayout(preservingOrigin: preservingOrigin)
    }

    //
    // Direction, justity, alignment / position
    //
    @discardableResult
    public func direction(_ direction: Direction) -> Flexbox {
        view.yoga.flexDirection = direction.yogaValue
        return self
    }
    
    @discardableResult
    public func justify(_ value: Justify) -> Flexbox {
        view.yoga.justifyContent = value.yogaValue
        return self
    }
    
    @discardableResult
    public func alignContent(_ value: Align) -> Flexbox {
        view.yoga.alignContent = value.yogaValue
        return self
    }
    
    @discardableResult
    public func alignSelf(_ value: Align) -> Flexbox {
        view.yoga.alignSelf = value.yogaValue
        return self
    }

    @discardableResult
    public func alignItems(_ value: Align) -> Flexbox {
        view.yoga.alignItems = value.yogaValue
        return self
    }
    
    @discardableResult
    public func position(_ value: Position) -> Flexbox {
        view.yoga.position = value.yogaValue
        return self
    }

    @discardableResult
    public func wrap(_ value: Wrap) -> Flexbox {
        view.yoga.flexWrap = value.yogaValue
        return self
    }

    @discardableResult
    public func overflow(_ value: Overflow) -> Flexbox {
        view.yoga.overflow = value.yogaValue
        return self
    }

    //
    // flexGrow / flexShrink / flexBasis
    //
    @discardableResult
    public func flexGrow(_ value: CGFloat) -> Flexbox {
        view.yoga.flexGrow = value
       return self
    }
    
    @discardableResult
    public func flexShrink(_ value: CGFloat) -> Flexbox {
        view.yoga.flexShrink = value
        return self
    }

    @discardableResult
    public func flexBasis(_ value: CGFloat) -> Flexbox {
        view.yoga.flexBasis = YGValue(value)
        return self
    }

    @discardableResult
    public func flex(_ grow: CGFloat, shrink: CGFloat? = nil, basis: CGFloat? = nil) -> Flexbox {
        view.yoga.flexGrow = grow

        if let shrink = shrink {
            view.yoga.flexShrink = shrink
        }

        if let basis = basis {
            view.yoga.flexBasis = YGValue(basis)
        }

        return self
    }


    //
    // left / top / right / bottom / start / end
    //
    @discardableResult
    public func left(_ value: CGFloat) -> Flexbox {
        view.yoga.left = YGValue(value)
        return self
    }

    @discardableResult
    public func top(_ value: CGFloat) -> Flexbox {
        view.yoga.top = YGValue(value)
        return self
    }

    @discardableResult
    public func right(_ value: CGFloat) -> Flexbox {
        view.yoga.right = YGValue(value)
        return self
    }

    @discardableResult
    public func bottom(_ value: CGFloat) -> Flexbox {
        view.yoga.bottom = YGValue(value)
        return self
    }

    @discardableResult
    public func start(_ value: CGFloat) -> Flexbox {
        view.yoga.start = YGValue(value)
        return self
    }

    @discardableResult
    public func end(_ value: CGFloat) -> Flexbox {
        view.yoga.end = YGValue(value)
        return self
    }

    //
    // Width / height / height
    //
    @discardableResult
    public func width(_ value: CGFloat) -> Flexbox {
        view.yoga.width = YGValue(value)
        return self
    }
    
    @discardableResult
    public func height(_ value: CGFloat) -> Flexbox {
        view.yoga.height = YGValue(value)
        return self
    }
    
    @discardableResult func size(_ size: CGSize) -> Flexbox {
        self.view.yoga.width = YGValue(size.width)
        self.view.yoga.height = YGValue(size.height)
        return self
    }
    
    @discardableResult func size(_ sideLength: CGFloat) -> Flexbox{
        self.view.yoga.width = YGValue(sideLength)
        self.view.yoga.height = YGValue(sideLength)
        return self
    }

    @discardableResult
    public func minWidth(_ value: CGFloat) -> Flexbox {
        view.yoga.minWidth = YGValue(value)
        return self
    }

    @discardableResult
    public func minHeight(_ value: CGFloat) -> Flexbox {
        view.yoga.minHeight = YGValue(value)
        return self
    }

    @discardableResult
    public func maxWidth(_ value: CGFloat) -> Flexbox {
        view.yoga.maxWidth = YGValue(value)
        return self
    }

    @discardableResult
    public func maxHeight(_ value: CGFloat) -> Flexbox {
        view.yoga.maxHeight = YGValue(value)
        return self
    }

    @discardableResult
    public func aspectRatio(_ value: CGFloat) -> Flexbox {
        view.yoga.aspectRatio = value
        return self
    }
    
    //
    // Margins
    //
    @discardableResult
    public func marginTop(_ value: CGFloat) -> Flexbox {
        view.yoga.marginTop = YGValue(value)
        return self
    }
    
    @discardableResult
    public func marginLeft(_ value: CGFloat) -> Flexbox {
        view.yoga.marginLeft = YGValue(value)
        return self
    }

    @discardableResult
    public func marginStart(_ value: CGFloat) -> Flexbox {
        view.yoga.marginStart = YGValue(value)
        return self
    }
    
    @discardableResult
    public func marginBottom(_ value: CGFloat) -> Flexbox {
        view.yoga.marginBottom = YGValue(value)
        return self
    }
    
    @discardableResult
    public func marginRight(_ value: CGFloat) -> Flexbox {
        view.yoga.marginRight = YGValue(value)
        return self
    }

    @discardableResult
    public func marginEnd(_ value: CGFloat) -> Flexbox {
        view.yoga.marginEnd = YGValue(value)
        return self
    }
    
    @discardableResult
    public func marginHorizontal(_ value: CGFloat) -> Flexbox {
        view.yoga.marginHorizontal = YGValue(value)
        return self
    }
    
    @discardableResult
    public func marginVertical(_ value: CGFloat) -> Flexbox {
        view.yoga.marginVertical = YGValue(value)
        return self
    }

    @discardableResult
    public func margin(_ value: CGFloat) -> Flexbox {
        view.yoga.margin = YGValue(value)
        return self
    }
    
    @discardableResult func margin(_ vertical: CGFloat, _ horizontal: CGFloat) -> Flexbox {
        view.yoga.marginVertical = YGValue(vertical)
        view.yoga.marginHorizontal = YGValue(horizontal)
        return self
    }
    
    @discardableResult func margin(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> Flexbox {
        view.yoga.marginTop = YGValue(top)
        view.yoga.marginHorizontal = YGValue(horizontal)
        view.yoga.marginBottom = YGValue(bottom)
        return self
    }

    @discardableResult
    public func margin(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> Flexbox {
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
    public func paddingTop(_ value: CGFloat) -> Flexbox {
        view.yoga.paddingTop = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingLeft(_ value: CGFloat) -> Flexbox {
        view.yoga.paddingLeft = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingBottom(_ value: CGFloat) -> Flexbox {
        view.yoga.paddingBottom = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingRight(_ value: CGFloat) -> Flexbox {
        view.yoga.paddingRight = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingStart(_ value: CGFloat) -> Flexbox {
        view.yoga.paddingStart = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingEnd(_ value: CGFloat) -> Flexbox {
        view.yoga.paddingEnd = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingHorizontal(_ value: CGFloat) -> Flexbox {
        view.yoga.paddingHorizontal = YGValue(value)
        return self
    }

    @discardableResult
    public func paddingVertical(_ value: CGFloat) -> Flexbox {
        view.yoga.paddingVertical = YGValue(value)
        return self
    }

    @discardableResult
    public func padding(_ value: CGFloat) -> Flexbox {
        view.yoga.padding = YGValue(value)
        return self
    }

    @discardableResult func padding(_ vertical: CGFloat, _ horizontal: CGFloat) -> Flexbox {
        view.yoga.paddingVertical = YGValue(vertical)
        view.yoga.paddingHorizontal = YGValue(horizontal)
        return self
    }
    
    @discardableResult func padding(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> Flexbox {
        view.yoga.paddingTop = YGValue(top)
        view.yoga.paddingHorizontal = YGValue(horizontal)
        view.yoga.paddingBottom = YGValue(bottom)
        return self
    }
    
    @discardableResult
    public func padding(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> Flexbox {
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
    public func borderLeft(_ value: CGFloat) -> Flexbox {
        view.yoga.borderLeftWidth = value
        return self
    }

    public func borderTop(_ value: CGFloat) -> Flexbox {
        view.yoga.borderTopWidth = value
        return self
    }

    public func borderRight(_ value: CGFloat) -> Flexbox {
        view.yoga.borderRightWidth = value
        return self
    }

    public func borderBottom(_ value: CGFloat) -> Flexbox {
        view.yoga.borderBottomWidth = value
        return self
    }

    public func borderStart(_ value: CGFloat) -> Flexbox {
        view.yoga.borderStartWidth = value
        return self
    }

    public func borderEnd(_ value: CGFloat) -> Flexbox {
        view.yoga.borderEndWidth = value
        return self
    }

    public func border(_ value: CGFloat) -> Flexbox {
        view.yoga.borderWidth = value
        return self
    }
}

