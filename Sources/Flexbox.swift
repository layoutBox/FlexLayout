//
//  Flexbox.swift
//  MinceAVie
//
//  Created by DION, Luc (MTL) on 2017-03-04.
//  Copyright © 2017 Mirego. All rights reserved.
//

import Foundation
import YogaKit

/*extension YGLayout {
    @discardableResult
    func flexContainer(flexDirection: YGFlexDirection = .column, justifyContent: YGJustify = .flexStart) -> YGLayout {
        isEnabled = true
        self.flexDirection = flexDirection
        self.justifyContent = justifyContent
        return self
    }
    
    @discardableResult
    func flex(flexGrow: CGFloat = 0, flexShrink: CGFloat = 0) -> YGLayout {
        isEnabled = true
        self.flexGrow = 1
        self.flexShrink = 1
        return self
    }
    
    @discardableResult
    func height(_ height: CGFloat) -> YGLayout {
        self.height = height
        return self
    }
    
    @discardableResult
    func width(_ width: CGFloat) -> YGLayout {
        self.width = width
        return self
    }
    
    @discardableResult
    func align(_ align: YGAlign) -> YGLayout {
        self.alignSelf = align
        return self
    }
}*/

protocol FlexboxView: class {
    //var marginTop: CGFloat { get set }
    //    func addFlexboxContainer(_ containerView: UIView, flexDirection: YGFlexDirection,
    //                             justifyContent: YGJustify, closure: (_ flexboxView: FlexboxView) -> Void)
    //    func addFlexboxItem(_ view: UIView, closure: (_ flexboxView: UIView) -> Void)
}

/*extension FlexboxView where Self: UIView {
    var fb: YGLayout {
        return self.yoga
    }
    
    func configureAsFlexboxContainer(flexDirection: YGFlexDirection = .column,
                                     justifyContent: YGJustify = .flexStart, closure: (_ flexboxView: UIView) -> Void) {
//        fb.isEnabled = true
        fb.flexContainer(flexDirection: flexDirection, justifyContent: justifyContent)
        closure(self)
    }
    
    func configureAsFlexboxContainer(flexDirection: YGFlexDirection = .column,
                                     justifyContent: YGJustify = .flexStart) {
//        fb.isEnabled = true
        fb.flexContainer(flexDirection: flexDirection, justifyContent: justifyContent)
    }
    
    func createFlexboxContainer(flexDirection: YGFlexDirection = .column, justifyContent: YGJustify = .flexStart,
                                closure: (_ flexboxView: UIView) -> Void) {
        let containerView = UIView()
        addFlexboxContainer(containerView, flexDirection: flexDirection, justifyContent: justifyContent, closure: closure)
    }
    
    func addFlexboxContainer(_ containerView: UIView, flexDirection: YGFlexDirection = .column,
                             justifyContent: YGJustify = .flexStart, closure: (_ flexboxView: UIView) -> Void) {
        addSubview(containerView)
        containerView.configureAsFlexboxContainer(flexDirection: flexDirection, justifyContent: justifyContent, closure: closure)
    }
    
    func addFlexboxContainer(_ containerView: UIView, flexDirection: YGFlexDirection = .column,
                             justifyContent: YGJustify = .flexStart) {
        addSubview(containerView)
        containerView.configureAsFlexboxContainer(flexDirection: flexDirection, justifyContent: justifyContent)
    }
    
    func addFlexboxItem(_ view: UIView, closure: (_ flexboxView: UIView) -> Void) {
        view.fb.isEnabled = true
        addSubview(view)
        closure(view)
    }
    
    func addFlexboxItem(_ view: UIView) {
        view.fb.isEnabled = true
        addSubview(view)
    }
}*/

enum FlexboxDirection { // should use react native name
    
}

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
        case center
        case flexEnd
        case spaceBetween
        case spaceAround
    }

    public enum Align {
        case auto
        case flexStart
        case center
        case flexEnd
        case stretch
        case baseline
        case spaceBetween
        case spaceAround
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
    public func alignItems(_ value: Align) -> Flexbox {
        view.yoga.alignItems = value.yogaValue
        return self
    }

    @discardableResult
    public func alignSelf(_ value: Align) -> Flexbox {
        view.yoga.alignSelf = value.yogaValue
        return self
    }

    @discardableResult
    public func position(_ value: Position) -> Flexbox {
        view.yoga.position = value.yogaValue
        return self
    }

    @discardableResult
    public func flexWrap(_ value: Wrap) -> Flexbox {
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
    public func grow(_ value: CGFloat) -> Flexbox {
        view.yoga.flexGrow = value
       return self
    }
    
    @discardableResult
    public func shrink(_ value: CGFloat) -> Flexbox {
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
//    This is the shorthand for flex-grow, flex-shrink and flex-basis combined. The second and third parameters (flex-shrink and flex-basis) are optional. Default is 0 1 auto


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

    // TODO: Add all PinLayout's width/height/size methods
    // size(of:), width(percent), ...

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
    public func borderLeft(_ width: CGFloat) -> Flexbox {
        view.yoga.borderLeftWidth = width
        return self
    }

    public func borderTop(_ width: CGFloat) -> Flexbox {
        view.yoga.borderTopWidth = width
        return self
    }

    public func borderRight(_ width: CGFloat) -> Flexbox {
        view.yoga.borderRightWidth = width
        return self
    }

    public func borderBottom(_ width: CGFloat) -> Flexbox {
        view.yoga.borderBottomWidth = width
        return self
    }

    public func borderStart(_ width: CGFloat) -> Flexbox {
        view.yoga.borderStartWidth = width
        return self
    }

    public func borderEnd(_ width: CGFloat) -> Flexbox {
        view.yoga.borderEndWidth = width
        return self
    }

    public func border(_ width: CGFloat) -> Flexbox {
        view.yoga.borderWidth = width
        return self
    }

    //
    // Layout
    //
    public func layout(preservingOrigin: Bool = true) {
        view.yoga.applyLayout(preservingOrigin: preservingOrigin)
    }
}

var fbLayoutAssociatedObjectHandle = 0x723AACC23
public extension UIView {
    public var flexbox: Flexbox {
        get {
            return objc_getAssociatedObject(self, &fbLayoutAssociatedObjectHandle) as? Flexbox ?? Flexbox(view: self)
        }
        set {
            objc_setAssociatedObject(self, &fbLayoutAssociatedObjectHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

extension Flexbox.Direction {
    var yogaValue: YGFlexDirection {
        switch self {
        case .column:        return YGFlexDirection.column
        case .columnReverse: return YGFlexDirection.columnReverse
        case .row:           return YGFlexDirection.row
        case .rowReverse:    return YGFlexDirection.rowReverse
        }
    }
}
extension Flexbox.Overflow {
    var yogaValue: YGOverflow {
        switch self {
        case .visible: return YGOverflow.visible
        case .hidden:  return YGOverflow.hidden
        case .scroll:  return YGOverflow.scroll
        }
    }
}

extension Flexbox.Justify {
    var yogaValue: YGJustify {
        switch self {
        case .flexStart:        return YGJustify.flexStart
        case .center:       return YGJustify.center
        case .flexEnd:          return YGJustify.flexEnd
        case .spaceBetween: return YGJustify.spaceBetween
        case .spaceAround:  return YGJustify.spaceAround
        }
    }
}

extension Flexbox.Align {
    var yogaValue: YGAlign {
        switch self {
        case .auto:         return YGAlign.auto
        case .flexStart:    return YGAlign.flexStart
        case .center:       return YGAlign.center
        case .flexEnd:      return YGAlign.flexEnd
        case .stretch:      return YGAlign.stretch
        case .baseline:     return YGAlign.baseline
        case .spaceBetween: return YGAlign.spaceBetween
        case .spaceAround:  return YGAlign.spaceAround
        }
    }
}

extension Flexbox.Wrap {
    var yogaValue: YGWrap {
        switch self {
        case .noWrap:      return YGWrap.noWrap
        case .wrap:        return YGWrap.wrap
        case .wrapReverse: return YGWrap.wrapReverse
        }
    }
}

extension Flexbox.Position {
    var yogaValue: YGPositionType {
        switch self {
        case .relative: return YGPositionType.relative
        case .absolute: return YGPositionType.absolute
        }
    }
}
