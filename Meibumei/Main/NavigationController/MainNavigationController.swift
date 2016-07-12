//
//  MainNavigationController.swift
//  Meibumei
//
//  Created by 俞诚恺 on 16/7/11.
//  Copyright © 2016年 Kie. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    @objc private func back() {
        popViewControllerAnimated(true)
    }
    
    // 设置导航栏颜色这里调用才起效
    override class func initialize() {
        setupThemes()
    }

    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

    private static func setupThemes() {
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor.RGBA(251, g: 197, b: 37, a: 1)
    }
}
