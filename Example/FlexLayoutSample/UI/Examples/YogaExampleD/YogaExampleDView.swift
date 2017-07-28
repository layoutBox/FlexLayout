//
//  YogaExampleDView.swift
//  FlexLayoutSample
//
//  Created by Luc Dion on 2017-07-19.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit
import FlexLayout
import PinLayout

class YogaExampleDView: BaseView {
    fileprivate let rootFlexContainer = UIView()

    override init() {
        super.init()

        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor
        
        let label = UIView()
        label.backgroundColor = .black
        
        // Yoga's C# example
        rootFlexContainer.flex.justifyContent(.start).alignItems(.start).define { (flex) in
            flex.addItem(imageView).alignSelf(.stretch).grow(1)
            flex.addItem(label).width(300).height(25).margin(20)
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
