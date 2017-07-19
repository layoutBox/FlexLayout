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

        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor
        
        let label = UILabel()
        label.text = "This is a string This is a string This is a st ri ng Th is is a string This is a string"
        label.numberOfLines = 0
        
        // Yoga's Android example
        rootFlexbox.flexbox.define { (flexbox) in
            flexbox.addChild(imageView).flexGrow(1)
            
            flexbox.createBox().direction(.row).padding(20).alignItems(.center).define({ (flexbox) in
                flexbox.createBox().size(50).define({ (flexbox) in
                    flexbox.view.backgroundColor = .flexLayoutColor
                })

                flexbox.createBox().height(25).marginStart(20).flexGrow(1).define({ (flexbox) in
                    flexbox.view.backgroundColor = .black
                })
            })
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
