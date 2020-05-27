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
// Created by Luc Dion on 2017-07-17.

import UIKit

#if FLEXLAYOUT_SWIFT_PACKAGE
import FlexLayoutYoga

extension YGFlexDirection {
    static let column = YGFlexDirectionColumn
    static let columnReverse = YGFlexDirectionColumnReverse
    static let row = YGFlexDirectionRow
    static let rowReverse = YGFlexDirectionRowReverse
}

extension YGJustify {
    static let flexStart = YGJustifyFlexStart
    static let center = YGJustifyCenter
    static let flexEnd = YGJustifyFlexEnd
    static let spaceBetween = YGJustifySpaceBetween
    static let spaceAround = YGJustifySpaceAround
    static let spaceEvenly = YGJustifySpaceEvenly
}

extension YGAlign {
    static let auto = YGAlignAuto
    static let baseline = YGAlignBaseline
    static let stretch = YGAlignStretch
    static let flexStart = YGAlignFlexStart
    static let center = YGAlignCenter
    static let flexEnd = YGAlignFlexEnd
    static let spaceBetween = YGAlignSpaceBetween
    static let spaceAround = YGAlignSpaceAround
}

extension YGWrap {
    static let noWrap = YGWrapNoWrap
    static let wrap = YGWrapWrap
    static let wrapReverse = YGWrapWrapReverse
}

extension YGPositionType {
    static let relative = YGPositionTypeRelative
    static let absolute = YGPositionTypeAbsolute
}

extension YGDirection {
    static let LTR = YGDirectionLTR
    static let RTL = YGDirectionRTL
    static let inherit = YGDirectionInherit
}

extension YGDisplay {
    static let flex = YGDisplayFlex
    static let none = YGDisplayNone
}

extension YGUnit {
    static let percent = YGUnitPercent
    static let point = YGUnitPoint
}
#endif

extension Flex.Direction {
    var yogaValue: YGFlexDirection {
        switch self {
        case .column:        return YGFlexDirection.column
        case .columnReverse: return YGFlexDirection.columnReverse
        case .row:           return YGFlexDirection.row
        case .rowReverse:    return YGFlexDirection.rowReverse
        }
    }
}

extension Flex.JustifyContent {
    var yogaValue: YGJustify {
        switch self {
        case .start:        return YGJustify.flexStart
        case .center:       return YGJustify.center
        case .end:          return YGJustify.flexEnd
        case .spaceBetween: return YGJustify.spaceBetween
        case .spaceAround:  return YGJustify.spaceAround
        case .spaceEvenly:  return YGJustify.spaceEvenly
        }
    }
}

extension Flex.AlignContent {
    var yogaValue: YGAlign {
        switch self {
        case .stretch:      return YGAlign.stretch
        case .start:        return YGAlign.flexStart
        case .center:       return YGAlign.center
        case .end:          return YGAlign.flexEnd
        case .spaceBetween: return YGAlign.spaceBetween
        case .spaceAround:  return YGAlign.spaceAround
        }
    }
}

extension Flex.AlignItems {
    var yogaValue: YGAlign {
        switch self {
        case .stretch:      return YGAlign.stretch
        case .start:        return YGAlign.flexStart
        case .center:       return YGAlign.center
        case .end:          return YGAlign.flexEnd
        case .baseline:     return YGAlign.baseline
        }
    }
}

extension Flex.AlignSelf {
    var yogaValue: YGAlign {
        switch self {
        case .auto:         return YGAlign.auto
        case .stretch:      return YGAlign.stretch
        case .start:        return YGAlign.flexStart
        case .center:       return YGAlign.center
        case .end:          return YGAlign.flexEnd
        case .baseline:     return YGAlign.baseline
        }
    }
}

extension Flex.Wrap {
    var yogaValue: YGWrap {
        switch self {
        case .noWrap:      return YGWrap.noWrap
        case .wrap:        return YGWrap.wrap
        case .wrapReverse: return YGWrap.wrapReverse
        }
    }
}

extension Flex.Position {
    var yogaValue: YGPositionType {
        switch self {
        case .relative: return YGPositionType.relative
        case .absolute: return YGPositionType.absolute
        }
    }
}

extension Flex.LayoutDirection {
    var yogaValue: YGDirection {
        switch self {
        case .ltr: return YGDirection.LTR
        case .rtl: return YGDirection.RTL
        default:   return YGDirection.inherit
        }
    }
}

extension Flex.Display {
    var yogaValue: YGDisplay {
        switch self {
        case .flex: return YGDisplay.flex
        case .none: return YGDisplay.none
        }
    }
}

/*extension Flex.Overflow {
    var yogaValue: YGOverflow {
        switch self {
        case .visible: return YGOverflow.visible
        case .hidden:  return YGOverflow.hidden
        case .scroll:  return YGOverflow.scroll
        }
    }
}*/
