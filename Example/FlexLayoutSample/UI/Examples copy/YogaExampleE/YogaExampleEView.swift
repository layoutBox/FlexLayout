//
//  YogaExampleEView.swift
//  FlexLayoutSample
//
//  Created by Luc Dion on 2017-07-19.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit
import FlexLayout
import PinLayout

class YogaExampleEView: BaseView {
    fileprivate let rootFlexbox = UIView()

    override init() {
        super.init()

        addSubview(rootFlexbox)

        rootFlexbox.flexbox.direction(.row).padding(20).define { (flexbox) in
            flexbox.createBox().width(80).marginEnd(20).define({ (flexbox) in
                flexbox.view.backgroundColor = .flexLayoutColor
            })

            flexbox.createBox().height(25).alignSelf(.center).flexGrow(1).define({ (flexbox) in
                flexbox.view.backgroundColor = .black
            })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // Layout the flexbox container using PinLayout
        rootFlexbox.pin.topLeft().width(100%).height(120).marginTop(topLayoutGuide)

        // Then let the flexbox container layout itself
        rootFlexbox.flexbox.layout()
    }
}
