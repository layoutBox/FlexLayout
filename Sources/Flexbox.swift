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
    public func direction(_ flexDirection: YGFlexDirection) -> Flexbox {
        view.yoga.flexDirection = flexDirection
        return self
    }
    
    @discardableResult
    public func justify(_ value: YGJustify) -> Flexbox {
        view.yoga.justifyContent = value
        return self
    }
    
    @discardableResult
    public func alignContent(_ value: YGAlign) -> Flexbox {
        view.yoga.alignContent = value
        return self
    }
    
    @discardableResult
    public func alignItems(_ value: YGAlign) -> Flexbox {
        view.yoga.alignItems = value
        return self
    }

    @discardableResult
    public func alignSelf(_ value: YGAlign) -> Flexbox {
        view.yoga.alignSelf = value
        return self
    }

    @discardableResult
    public func position(_ value: YGPositionType) -> Flexbox {
        view.yoga.position = value
        return self
    }

    @discardableResult
    public func flexWrap(_ value: YGWrap) -> Flexbox {
        view.yoga.flexWrap = value
        return self
    }

    @discardableResult
    public func overflow(_ value: YGOverflow) -> Flexbox {
        view.yoga.overflow = value
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
    public func borderLeftWidth(_ value: CGFloat) -> Flexbox {
        view.yoga.borderLeftWidth = value
        return self
    }

    public func borderTopWidth(_ value: CGFloat) -> Flexbox {
        view.yoga.borderTopWidth = value
        return self
    }

    public func borderRightWidth(_ value: CGFloat) -> Flexbox {
        view.yoga.borderRightWidth = value
        return self
    }

    public func borderBottomWidth(_ value: CGFloat) -> Flexbox {
        view.yoga.borderBottomWidth = value
        return self
    }

    public func borderStartWidth(_ value: CGFloat) -> Flexbox {
        view.yoga.borderStartWidth = value
        return self
    }

    public func borderEndWidth(_ value: CGFloat) -> Flexbox {
        view.yoga.borderEndWidth = value
        return self
    }

    public func borderWidth(_ value: CGFloat) -> Flexbox {
        view.yoga.borderWidth = value
        return self
    }

    //
    // Layout
    //
    public func layout() {
        view.yoga.applyLayout(preservingOrigin: false)
    }
}

var fbLayoutAssociatedObjectHandle = 0x98723AACC23
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
