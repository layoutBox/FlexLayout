//
//  YogaExampleEViewController.swift
//  FlexLayoutSample
//
//  Created by Luc Dion on 2017-07-19.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit

class YogaExampleEViewController: BaseViewController {
    fileprivate var mainView: YogaExampleEView {
        return self.view as! YogaExampleEView
    }

    init(pageType: PageType) {
        super.init(nibName: nil, bundle: nil)
        title = pageType.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        view = YogaExampleEView()
    }
}
