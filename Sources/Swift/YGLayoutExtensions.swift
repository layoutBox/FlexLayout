/**
 * Copyright (c) 2014-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import CoreGraphics
import FlexLayoutYoga

postfix operator %

extension Int {
    public static postfix func % (value: Int) -> YGValue {
        return YGValue(value: Float(value), unit: YGUnitPercent)
    }
}

extension Float {
    public static postfix func % (value: Float) -> YGValue {
        return YGValue(value: value, unit: YGUnitPercent)
    }
}

extension CGFloat {
    public static postfix func % (value: CGFloat) -> YGValue {
        return YGValue(value: Float(value), unit: YGUnitPercent)
    }
}

extension YGValue: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    public init(integerLiteral value: Int) {
        self = YGValue(value: Float(value), unit: YGUnitPoint)
    }
    
    public init(floatLiteral value: Float) {
        self = YGValue(value: value, unit: YGUnitPoint)
    }
  
    public init(_ value: Float) {
        self = YGValue(value: value, unit: YGUnitPoint)
    }
  
    public init(_ value: CGFloat) {
        self = YGValue(value: Float(value), unit: YGUnitPoint)
    }
}
