// Copyright (c) 2017, Mirego
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// - Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
// - Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
// - Neither the name of the Mirego nor the names of its contributors may
//   be used to endorse or promote products derived from this software without
//   specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

import UIKit

enum PageType: Int {
    case yogaExampleA
    case yogaExampleB
    case yogaExampleC
    case yogaExampleD
    case yogaExampleE
    case flex
    
    case count
    
    var text: String {
        switch self {
        case .yogaExampleA:   return "Yoga C Example"
        case .yogaExampleB:   return "Yoga Obj-C Example"
        case .yogaExampleC:   return "Yoga Java Example"
        case .yogaExampleD:   return "Yoga C# Example"
        case .yogaExampleE:   return "Yoga Android Example"
        case .flex:           return "Flexbox"
        case .count:          return ""
        }
    }

    var viewController: UIViewController {
        switch self {
        case .yogaExampleA:   return YogaExampleAViewController(pageType: self)
        case .yogaExampleB:   return YogaExampleBViewController(pageType: self)
        case .yogaExampleC:   return YogaExampleCViewController(pageType: self)
        case .yogaExampleD:   return YogaExampleDViewController(pageType: self)
        case .yogaExampleE:   return YogaExampleEViewController(pageType: self)
        case .flex:           return FlexboxViewController(pageType: self)
        case .count:          return UIViewController()
        }
    }
}

class MenuViewController: BaseViewController {
    fileprivate var mainView: MenuView {
        return self.view as! MenuView
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        title = "FlexLayout Examples"
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = MenuView()
        mainView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        didSelect(pageType: .flex)
    }
}

// MARK: MenuViewDelegate
extension MenuViewController: MenuViewDelegate {
    func didSelect(pageType: PageType) {
        navigationController?.pushViewController(pageType.viewController, animated: true)
    }
}
