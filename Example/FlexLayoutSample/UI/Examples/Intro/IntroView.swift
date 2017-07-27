//
//  IntroView.swift
//  FlexLayoutSample
//
//  Created by Luc Dion on 2017-07-19.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit
import FlexLayout
import PinLayout

class IntroView: BaseView {
    fileprivate let rootFlexbox = UIView()

    override init() {
        super.init()

        let imageView = UIImageView(image: UIImage(named: "flexlayout-logo"))
        
        let segmentedControl = UISegmentedControl(items: ["Intro", "1", "2"])
        segmentedControl.selectedSegmentIndex = 0
        
        let label = UILabel()
        label.text = "Swift manual views layouting without auto layout, no magic, pure code, full control. Concise syntax, readable & chainable.\n\nSwift manual views layouting without auto layout, no magic, pure code, full control. Concise syntax, readable & chainable."
        label.numberOfLines = 0
        
        rootFlexbox.flexbox.padding(12).define { (flexbox) in
            flexbox.addContainer().direction(.row).define { (flexbox) in
                flexbox.addItem(imageView).width(100).aspectRatio(of: imageView)
                
                flexbox.addContainer().paddingLeft(12).define { (flexbox) in
                    flexbox.addItem(segmentedControl).marginBottom(12)
                    flexbox.addItem(label)
                }
            }
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
        rootFlexbox.pin.topLeft().width(100%).marginTop(topLayoutGuide)

        // Then let the flexbox container layout itself
        rootFlexbox.flexbox.layout(mode: .adjustHeight)
    }
}
