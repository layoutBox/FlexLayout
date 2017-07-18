//
//  FixLayout+Enum.swift
//  FlexLayout
//
//  Created by Luc Dion on 2017-07-17.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit
import YogaKit

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
        //case .auto:         return YGAlign.auto
        case .flexStart:    return YGAlign.flexStart
        case .center:       return YGAlign.center
        case .flexEnd:      return YGAlign.flexEnd
        case .stretch:      return YGAlign.stretch
        case .baseline:     return YGAlign.baseline
        //case .spaceBetween: return YGAlign.spaceBetween
        //case .spaceAround:  return YGAlign.spaceAround
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
