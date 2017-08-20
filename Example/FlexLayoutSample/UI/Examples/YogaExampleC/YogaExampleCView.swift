//
//  YogaExampleCView.swift
//  FlexLayoutSample
//
//  Created by Luc Dion on 2017-07-19.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit
import FlexLayout
import PinLayout

class YogaExampleCView: BaseView {
    fileprivate let rootFlexContainer = UIView()

    override init() {
        super.init()

        let label = UIView()
        label.backgroundColor = .black
        
        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor
        
        // Yoga's Java Example
        rootFlexContainer.flex.alignItems(.center).justifyContent(.center).padding(20).define { (flex) in
            flex.addItem(label).width(200).height(25)
            flex.addItem(imageView).position(.absolute).top(20).end(20).size(50)
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
        rootFlexContainer.pin.top(topLayoutGuide).left().width(100%).height(300)

        // Then let the flexbox container layout itself
        rootFlexContainer.flex.layout()
    }
}
