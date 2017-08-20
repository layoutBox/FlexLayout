//
//  YogaExampleBView.swift
//  FlexLayoutSample
//
//  Created by Luc Dion on 2017-07-19.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit
import FlexLayout
import PinLayout

class YogaExampleBView: BaseView {
    fileprivate let rootFlexContainer = UIView()

    override init() {
        super.init()

        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor

        let label = UIView()
        label.backgroundColor = .black

        // Yoga's Objective-C Example
        rootFlexContainer.flex.alignItems(.center).justifyContent(.center).padding(20).define { (flex) in
            flex.addItem(imageView).size(150).aspectRatio(1).marginBottom(20)
            flex.addItem(label).width(100).height(25)
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
        rootFlexContainer.pin.top(topLayoutGuide).left().width(100%).height(200)
        
        // Then let the flexbox container layout itself
        rootFlexContainer.flex.layout()
    }
}
