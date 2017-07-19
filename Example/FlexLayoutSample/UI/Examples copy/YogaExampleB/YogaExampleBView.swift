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
    fileprivate let rootFlexbox = UIView()

    override init() {
        super.init()

        addSubview(rootFlexbox)

//        rootFlexbox.flexbox.direction(.row).padding(20).define { (flexbox) in
//            flexbox.createBox().width(80).marginEnd(20).define({ (flexbox) in
//                flexbox.view.backgroundColor = .flexLayoutColor
//            })
//
//            flexbox.createBox().height(25).alignSelf(.center).flexGrow(1).define({ (flexbox) in
//                flexbox.view.backgroundColor = .black
//            })
//        }

        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor

        let label = UIView()
        label.backgroundColor = .black

        // Yoga's Objective-C Example
        rootFlexbox.flexbox.alignItems(.center).justify(.center).padding(20).define { (flexbox) in
            flexbox.addChild(imageView).size(150).aspectRatio(1).marginBottom(20)
            flexbox.addChild(label).width(100).height(25)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // Layout the flexbox container using PinLayout
        rootFlexbox.pin.topLeft().width(100%).height(200).marginTop(topLayoutGuide)
//        rootFlexbox.pin.topLeft().marginTop(topLayoutGuide)

        // Then let the flexbox container layout itself
        rootFlexbox.flexbox.layout()
    }
}
