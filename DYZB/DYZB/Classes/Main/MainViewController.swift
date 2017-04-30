//
//  MainViewController.swift
//  DYZB
//
//  Created by 北京时代华擎 on 17/4/30.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addChildViewVc("Home")
        addChildViewVc("Live")
        addChildViewVc("Follow")
        addChildViewVc("Profile")

    }

    
    private func addChildViewVc(stroyName: String) {
        //1、通过storybord获取控制器
        let childVC=UIStoryboard(name: stroyName, bundle: nil).instantiateInitialViewController()!
        
        //2、将childVC作为子控制器
        addChildViewController(childVC)
    }
}
