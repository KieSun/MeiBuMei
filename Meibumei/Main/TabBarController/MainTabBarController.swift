//
//  MainTabBarController.swift
//  Meibumei
//
//  Created by 俞诚恺 on 16/7/11.
//  Copyright © 2016年 Kie. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewController()
    }
    
    private func addChildViewController() {
        addSingleController(HomeTableViewController(), norImage: "zhuye", selImage: "zhuyecai")
        addSingleController(DiscoverViewController(), norImage: "sousuo", selImage: "sousuocai")
        addSingleController(HotViewController(), norImage: "dingzhi", selImage: "dingzhicai")
        addSingleController(MyViewController(), norImage: "geren", selImage: "gerencai")
    }
    
    private func addSingleController(viewController: UIViewController, norImage: String, selImage: String) {
        let nav = MainNavigationController(rootViewController: viewController)
        // 这里图片有问题，文字和图片间距不一致
        nav.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 0, -8, 0)
        nav.tabBarItem.image = UIImage(named: norImage)
        nav.tabBarItem.selectedImage = UIImage(named: selImage)
        addChildViewController(nav)
    }

}
