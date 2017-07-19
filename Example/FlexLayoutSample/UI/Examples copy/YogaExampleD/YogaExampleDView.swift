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
    fileprivate let rootFlexbox = UIView()

    override init() {
        super.init()

        addSubview(rootFlexbox)

        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor
        
        let label = UIView()
        label.backgroundColor = .black
        
        // Yoga's C# example
        rootFlexbox.flexbox.justify(.flexStart).alignItems(.flexStart).define { (flexbox) in
            flexbox.addChild(imageView).alignSelf(.stretch).flexGrow(1)
            flexbox.addChild(label).width(300).height(25).margin(20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // Layout the flexbox container using PinLayout
        rootFlexbox.pin.topLeft().width(100%).height(300).marginTop(topLayoutGuide)

        // Then let the flexbox container layout itself
        rootFlexbox.flexbox.layout()
    }
}
