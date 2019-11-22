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
#if SPM_BUILD
import FlexLayoutYoga
#endif
extension Flex.Direction {
    var yogaValue: YGFlexDirection {
        switch self {
        case .column:        return YGFlexDirectionColumn
        case .columnReverse: return YGFlexDirectionColumnReverse
        case .row:           return YGFlexDirectionRow
        case .rowReverse:    return YGFlexDirectionRowReverse
        }
    }
}

extension Flex.JustifyContent {
    var yogaValue: YGJustify {
        switch self {
        case .start:        return YGJustifyFlexStart
        case .center:       return YGJustifyCenter
        case .end:          return YGJustifyFlexEnd
        case .spaceBetween: return YGJustifySpaceBetween
        case .spaceAround:  return YGJustifySpaceAround
        case .spaceEvenly:  return YGJustifySpaceEvenly
        }
    }
}

extension Flex.AlignContent {
    var yogaValue: YGAlign {
        switch self {
        case .stretch:      return YGAlignStretch
        case .start:        return YGAlignFlexStart
        case .center:       return YGAlignCenter
        case .end:          return YGAlignFlexEnd
        case .spaceBetween: return YGAlignSpaceBetween
        case .spaceAround:  return YGAlignSpaceAround
        }
    }
}

extension Flex.AlignItems {
    var yogaValue: YGAlign {
        switch self {
        case .stretch:      return YGAlignStretch
        case .start:        return YGAlignFlexStart
        case .center:       return YGAlignCenter
        case .end:          return YGAlignFlexEnd
        //case .baseline:     return YGAlign.baseline
        }
    }
}

extension Flex.AlignSelf {
    var yogaValue: YGAlign {
        switch self {
        case .auto:         return YGAlignAuto
        case .stretch:      return YGAlignStretch
        case .start:        return YGAlignFlexStart
        case .center:       return YGAlignCenter
        case .end:          return YGAlignFlexEnd
        case .baseline:     return YGAlignBaseline
        }
    }
}

extension Flex.Wrap {
    var yogaValue: YGWrap {
        switch self {
        case .noWrap:      return YGWrapNoWrap
        case .wrap:        return YGWrapWrap
        case .wrapReverse: return YGWrapWrapReverse
        }
    }
}

extension Flex.Position {
    var yogaValue: YGPositionType {
        switch self {
        case .relative: return YGPositionTypeRelative
        case .absolute: return YGPositionTypeAbsolute
        }
    }
}

extension Flex.LayoutDirection {
    var yogaValue: YGDirection {
        switch self {
        case .ltr: return YGDirectionLTR
        case .rtl: return YGDirectionRTL
        default:   return YGDirectionInherit
        }
    }
}

extension Flex.Display {
    var yogaValue: YGDisplay {
        switch self {
        case .flex: return YGDisplayFlex
        case .none: return YGDisplayNone
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
