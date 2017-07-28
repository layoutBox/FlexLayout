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
    fileprivate let rootFlexContainer = UIView()

    override init() {
        super.init()

        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor
        
        let label = UILabel()
        label.text = "This is a string This is a string This is a st ri ng Th is is a string This is a string"
        label.numberOfLines = 0
        
        // Yoga's Android example
        rootFlexContainer.flex.define { (flex) in
            flex.addItem(imageView).grow(1)
            
            flex.addContainer().direction(.row).padding(20).alignItems(.center).define({ (flex) in
                flex.addContainer().size(50).define({ (flex) in
                    flex.view.backgroundColor = .flexLayoutColor
                })

                flex.addContainer().height(25).marginStart(20).grow(1).define({ (flex) in
                    flex.view.backgroundColor = .black
                })
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
        rootFlexContainer.pin.top(topLayoutGuide).left().width(100%).height(300)

        // Then let the flexbox container layout itself
        rootFlexContainer.flex.layout()
    }
}
