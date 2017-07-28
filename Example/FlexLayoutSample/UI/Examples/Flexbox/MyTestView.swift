//  FlexboxView.swift
//  FlexLayoutSample
//
//  Created by DION, Luc (MTL) on 2017-06-19.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import Foundation
import UIKit
import FlexLayout
import PinLayout

class MyTestView: BaseView {
    
    fileprivate let rootFlexContainer = UIView()

    override init() {
        super.init()

            /*flexbox.addItem(flexboxContentView).direction(.row).justify(.flexStart).alignItems(.center).marginHorizontal(10).define { (fbContainer) in
            let rowLabel = UILabel()
            rowLabel.text = "Hello my friend"
            fbContainer.addItem(rowLabel).grow(1).shrink(1)
            
            fbContainer.addItem(CheckBox())
            fbContainer.addItem(CheckBox())
            fbContainer.addItem(CheckBox())
            fbContainer.addItem(CheckBox())*/

//        flexbox.addItem(rootFlexContainer).define { (flexbox) in
        
        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor
        
        let label = UILabel()
        label.text = "This is a string This is a string This is a st ri ng Th is is a string This is a string"
        label.numberOfLines = 0
        
        let container = UIView()
        container.backgroundColor = .blue
        
        flex.define { (flex) in
            flex.addItem(imageView).grow(1)
            
            flex.addItem(container).width(100).height(100)

//            flex.addItem(container).direction(.row).marginVertical(4).isVisible(false).alignItems(.center).define({ (flex) in
////                flex.createBox().width(50).height(50).define({ (flex) in
////                    flex.view.backgroundColor = .flexLayoutColor
////                })
//                flex.view.backgroundColor = .red
//
////                flex.createBox().height(25).marginStart(20).grow(1).define({ (flex) in
////                    flex.view.backgroundColor = .black
////                })
//            })

//            flex.addItem(label).marginHorizontal(20)
        }
        
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (_) in
//            UIView.animate(withDuration: 0.5, animations: {
//                container.flex.isVisible(false)
////                container.flex.setNeedsLayout()
//                self.relayoutFlexbox()
//            })
//        }

        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (_) in
//            UIView.animate(withDuration: 0.5, animations: {
                container.flex.isIncludedInLayout(false)
                container.isHidden = true
                self.relayoutFlexbox()
//            })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        flex.width(bounds.width).height(300).layout()

//        rootFlexContainer.flex.layout()
    }
    
    fileprivate func relayoutFlexbox() {
//        yoga.markDirty()
        flex.width(bounds.width).height(300).layout()
    }
}
