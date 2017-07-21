//
//  FlexView.swift
//  FlexLayout
//
//  Created by Luc Dion on 2017-07-19.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

class FlexView: UIView {

    enum LayoutMode {
        case none
        case layoutOnFrameChange
    }
    
    var layoutMode: LayoutMode = .none {
        didSet {

        }
    }

    override var frame: CGRect {
        didSet {
            print("frame: \(frame)")
        }
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return super.sizeThatFits(size)
    }
}
