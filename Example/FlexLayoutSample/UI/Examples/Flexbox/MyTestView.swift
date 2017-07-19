
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
    
    fileprivate let rootFlexbox = UIView()

    override init() {
        super.init()

            /*flexbox.addChild(flexboxContentView).direction(.row).justify(.flexStart).alignItems(.center).marginHorizontal(10).define { (fbContainer) in
            let rowLabel = UILabel()
            rowLabel.text = "Hello my friend"
            fbContainer.addChild(rowLabel).grow(1).shrink(1)
            
            fbContainer.addChild(CheckBox())
            fbContainer.addChild(CheckBox())
            fbContainer.addChild(CheckBox())
            fbContainer.addChild(CheckBox())*/

//        flexbox.addChild(rootFlexbox).define { (flexbox) in
        
        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor
        
        let label = UILabel()
        label.text = "This is a string This is a string This is a st ri ng Th is is a string This is a string"
        label.numberOfLines = 0
        
        let container = UIView()
        container.backgroundColor = .blue
        
        flexbox.define { (flexbox) in
            flexbox.addChild(imageView).flexGrow(1)
            
            flexbox.addChild(container).width(100).height(100)

//            flexbox.addChild(container).direction(.row).marginVertical(4).isVisible(false).alignItems(.center).define({ (flexbox) in
////                flexbox.createBox().width(50).height(50).define({ (flexbox) in
////                    flexbox.view.backgroundColor = .flexLayoutColor
////                })
//                flexbox.view.backgroundColor = .red
//
////                flexbox.createBox().height(25).marginStart(20).grow(1).define({ (flexbox) in
////                    flexbox.view.backgroundColor = .black
////                })
//            })

//            flexbox.addChild(label).marginHorizontal(20)
        }
        
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (_) in
//            UIView.animate(withDuration: 0.5, animations: {
//                container.flexbox.isVisible(false)
////                container.flexbox.setNeedsLayout()
//                self.relayoutFlexbox()
//            })
//        }

        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (_) in
//            UIView.animate(withDuration: 0.5, animations: {
                container.flexbox.isIncludedInLayout(false)
                self.relayoutFlexbox()
//            })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // C
        //rootFlexbox.pin.topLeft().right().height(120).marginTop(topLayoutGuide)

        // Obj-c
        //rootFlexbox.pin.topLeft().right().height(300).marginTop(topLayoutGuide)

        // Java
        //rootFlexbox.pin.topLeft().right().height(300).marginTop(topLayoutGuide)

        // C#
//        rootFlexbox.pin.topLeft().width(100%).height(300).marginTop(topLayoutGuide)
        
        flexbox.width(bounds.width).height(300).layout()
        
        let toto = flexbox
        print("toto: \(toto)")
        
//        rootFlexbox.flexbox.layout()
    }
    
    fileprivate func relayoutFlexbox() {
//        yoga.markDirty()
        flexbox.width(bounds.width).height(300).layout()
    }
}
