//
//  YogaExampleAView.swift
//  FlexLayoutSample
//
//  Created by Luc Dion on 2017-07-19.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit
import FlexLayout
import PinLayout

class YogaExampleAView: BaseView {
    fileprivate let rootFlexContainer = UIView()

    override init() {
        super.init()

        // Yoga's C Example
        rootFlexContainer.flex.direction(.row).padding(20).define { (flex) in
            flex.addContainer().width(80).marginEnd(20).define({ (flex) in
                flex.view.backgroundColor = .flexLayoutColor
            })

            flex.addContainer().height(25).alignSelf(.center).grow(1).define({ (flex) in
                flex.view.backgroundColor = .black
            })
        }
        addSubview(rootFlexContainer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // Layout the flexbox container using PinLayout
        // NOTE: Could be also layouted by setting directly rootFlexContainer.frame
        rootFlexContainer.pin.top(topLayoutGuide).left().width(100%).height(120)

        // Then let the flexbox container layout itself
        rootFlexContainer.flex.layout()
    }
}
