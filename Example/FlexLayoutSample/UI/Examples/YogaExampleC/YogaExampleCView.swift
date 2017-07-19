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
    fileprivate let rootFlexbox = UIView()

    override init() {
        super.init()

        let label = UIView()
        label.backgroundColor = .black
        
        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor
        
        // Yoga's Java Example
        rootFlexbox.flexbox.alignItems(.center).justify(.center).padding(20).define { (flexbox) in
            flexbox.addChild(label).width(200).height(25)
            flexbox.addChild(imageView).position(.absolute).top(20).end(20).size(50)
        }
        addSubview(rootFlexbox)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // Layout the flexbox container using PinLayout
        // NOTE: Could be also layouted by setting directly rootFlexbox.frame
        rootFlexbox.pin.topLeft().width(100%).height(300).marginTop(topLayoutGuide)

        // Then let the flexbox container layout itself
        rootFlexbox.flexbox.layout()
    }
}
