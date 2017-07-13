
//  FlexboxView.swift
//  PinLayoutSample
//
//  Created by DION, Luc (MTL) on 2017-06-19.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit
import FlexLayoutTest
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

        // C
//        flexbox.addChild(rootFlexbox).direction(.row).padding(20).define { (flexbox) in
//            flexbox.createBox().width(80).marginEnd(20).define({ (flexbox) in
//                flexbox.view.backgroundColor = .flexLayoutColor
//            })
//
//            flexbox.createBox().height(25).alignSelf(.center).grow(1).define({ (flexbox) in
//                flexbox.view.backgroundColor = .black
//            })
//        }

        // Obj-c
//        flexbox.addChild(rootFlexbox).alignItems(.center).justify(.center).padding(20).define { (flexbox) in
//            let imageView = UIView()
//            imageView.backgroundColor = .flexLayoutColor
//            imageView.pin.size(150)
//            flexbox.addChild(imageView).marginBottom(20)
//
//            let label = UIView()
//            label.backgroundColor = .black
//            label.pin.width(100).height(25)
//            flexbox.addChild(label)
//        }

        // Java
//        flexbox.addChild(rootFlexbox).alignItems(.center).justify(.center).padding(20).define { (flexbox) in
//            let label = UIView()
//            label.backgroundColor = .black
//            label.pin.width(200).height(25)
//            flexbox.addChild(label)
//
//            let imageView = UIView()
//            imageView.backgroundColor = .flexLayoutColor
//            imageView.pin.size(50)
//            flexbox.addChild(imageView).position(.absolute).top(20).end(20)
//
//        }

//        // C#
//        flexbox.addChild(rootFlexbox)/*.justify(.flexStart)*/.alignItems(.flexStart).define { (flexbox) in
//            let imageView = UIView()
//            imageView.backgroundColor = .flexLayoutColor
//            flexbox.addChild(imageView).alignSelf(.stretch).grow(1)
//
//            let label = UIView()
//            label.backgroundColor = .black
//            flexbox.addChild(label).width(300).height(25).margin(20)
//        }

        // Android
//        flexbox.addChild(rootFlexbox).define { (flexbox) in
        
        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor
        
        let label = UILabel()
        label.text = "This is a string This is a string This is a st ri ng Th is is a string This is a string"
        label.numberOfLines = 0
        
        flexbox.define { (flexbox) in
            flexbox.addChild(imageView).grow(1)

            flexbox.createBox().direction(.row).padding(20).alignItems(.center).define({ (flexbox) in
                flexbox.createBox().width(50).height(50).define({ (flexbox) in
                    flexbox.view.backgroundColor = .flexLayoutColor
                })

                flexbox.createBox().height(25).marginStart(20).grow(1).define({ (flexbox) in
                    flexbox.view.backgroundColor = .black
                })
            })

            flexbox.addChild(label).marginHorizontal(20)
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
        
//        rootFlexbox.flexbox.layout()
    }
}
