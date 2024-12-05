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

import yoga

extension Flex.Direction {
    var yogaValue: YGFlexDirection {
        switch self {
        case .column: .column
        case .columnReverse: .columnReverse
        case .row: .row
        case .rowReverse: .rowReverse
        }
    }
}

extension Flex.JustifyContent {
    var yogaValue: YGJustify {
        switch self {
        case .start: .flexStart
        case .center: .center
        case .end: .flexEnd
        case .spaceBetween: .spaceBetween
        case .spaceAround: .spaceAround
        case .spaceEvenly: .spaceEvenly
        }
    }
}

extension Flex.AlignContent {
    var yogaValue: YGAlign {
        switch self {
        case .stretch: .stretch
        case .start: .flexStart
        case .center: .center
        case .end: .flexEnd
        case .spaceBetween: .spaceBetween
        case .spaceAround: .spaceAround
        case .spaceEvenly: .spaceEvenly
        }
    }
}

extension Flex.AlignItems {
    var yogaValue: YGAlign {
        switch self {
        case .stretch: .stretch
        case .start: .flexStart
        case .center: .center
        case .end: .flexEnd
        case .baseline: .baseline
        }
    }
}

extension Flex.AlignSelf {
    var yogaValue: YGAlign {
        switch self {
        case .auto: .auto
        case .stretch: .stretch
        case .start: .flexStart
        case .center: .center
        case .end: .flexEnd
        case .baseline: .baseline
        }
    }
}

extension Flex.Wrap {
    var yogaValue: YGWrap {
        switch self {
        case .noWrap: .noWrap
        case .wrap: .wrap
        case .wrapReverse: .wrapReverse
        }
    }
}

extension Flex.Position {
    var yogaValue: YGPositionType {
        switch self {
        case .relative: .relative
        case .absolute: .absolute
        case .static: .static
        }
    }
}

extension Flex.LayoutDirection {
    var yogaValue: YGDirection {
        switch self {
        case .ltr: .LTR
        case .rtl: .RTL
        default: .inherit
        }
    }
}

extension Flex.Display {
    var yogaValue: YGDisplay {
        switch self {
        case .flex: .flex
        case .none: .none
        case .contents: .contents
        }
    }
}

extension Flex.BoxSizing {
    var yogaValue: YGBoxSizing {
        switch self {
        case .borderBox: .borderBox
        case .contentBox: .contentBox
        }
    }
}

/* extension Flex.Overflow {
     var yogaValue: YGOverflow {
         switch self {
         case .visible:  YGOverflow.visible
         case .hidden:   YGOverflow.hidden
         case .scroll:   YGOverflow.scroll
         }
     }
 } */
