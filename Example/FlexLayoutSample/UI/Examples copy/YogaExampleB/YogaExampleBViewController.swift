//
//  YogaExampleBViewController.swift
//  FlexLayoutSample
//
//  Created by Luc Dion on 2017-07-19.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit

class YogaExampleBViewController: BaseViewController {
    fileprivate var mainView: YogaExampleBView {
        return self.view as! YogaExampleBView
    }

    init(pageType: PageType) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        view = YogaExampleBView()
    }
}
