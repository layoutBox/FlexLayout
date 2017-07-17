//
//  UIView+FlexLayout.swift
//  FlexLayout
//
//  Created by Luc Dion on 2017-07-17.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

fileprivate var flexLayoutAssociatedObjectHandle = 72399923

public extension UIView {
    public var flexbox: Flexbox {
        get {
            return objc_getAssociatedObject(self, &flexLayoutAssociatedObjectHandle) as? Flexbox ?? Flexbox(view: self)
        }
        set {
            objc_setAssociatedObject(self, &flexLayoutAssociatedObjectHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
