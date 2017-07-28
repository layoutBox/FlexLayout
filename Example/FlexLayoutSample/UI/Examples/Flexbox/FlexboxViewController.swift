//
//  FlexboxViewController.swift
//  FlexLayoutSample
//
//  Created by DION, Luc (MTL) on 2017-06-19.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit
import FlexLayout

class FlexboxViewController: BaseViewController {
    fileprivate var mainView: MyTestView {
        return self.view as! MyTestView
    }

    init(pageType: PageType) {
        super.init()
        title = pageType.text
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        view = MyTestView()
    }
}
