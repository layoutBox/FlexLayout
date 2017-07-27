//
//  IntroViewController.swift
//  FlexLayoutSample
//
//  Created by Luc Dion on 2017-07-19.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit

class IntroViewController: BaseViewController {
    fileprivate var mainView: IntroView {
        return self.view as! IntroView
    }

    init(pageType: PageType) {
        super.init(nibName: nil, bundle: nil)
        title = pageType.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        view = IntroView()
    }
}
