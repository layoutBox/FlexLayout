//
//  YogaExampleAViewController.swift
//  FlexLayoutSample
//
//  Created by Luc Dion on 2017-07-19.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit

class YogaExampleAViewController: BaseViewController {
    fileprivate var mainView: YogaExampleAView {
        return self.view as! YogaExampleAView
    }

    init(pageType: PageType) {
        super.init()
        title = pageType.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        view = YogaExampleAView()
    }
}
