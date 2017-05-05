//
//  HomeViewController.swift
//  DYZB
//
//  Created by 北京时代华擎 on 17/4/30.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

import UIKit

private let titleViewH:CGFloat=40

class HomeViewController: UIViewController {

    
//懒加载属性
    private lazy var pageTitleView:PageTitleView = {
    
        let titleFrame=CGRect(x: 0, y: stateBarH+NavigationBar, width:screenW, height: titleViewH)
        let titles=["推荐","游戏","娱乐","趣玩"]
        let titleView=PageTitleView(frame: titleFrame, titles: titles)
        return titleView
    
    }()
    
//系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()

       }
    

}
//设置UI界面
extension HomeViewController{

    private func setUpUI(){
//不需要调整UIscrollView的内边距
        automaticallyAdjustsScrollViewInsets=false
        
//设置导航栏
        setUpNavigationBar()
        
//添加titlview
        view.addSubview(pageTitleView)
    
    }
    
    private func setUpNavigationBar(){
        
        let btn=UIButton()
        btn.setImage(UIImage (named: "homeLogoIcon"), forState:.Normal )
        btn.sizeToFit()
        navigationItem.leftBarButtonItem=UIBarButtonItem(customView: btn)
    
        
        let size=CGSize(width: 40, height: 40)

        let historyItem=UIBarButtonItem(imageName: "btn_close_danmu", highImage: "btn_close_danmu", size: size)
        

        let searchItem=UIBarButtonItem(imageName: "home_newSeacrhcon", highImage: "home_newSaoicon", size: size)
        

        let qrcodeItem=UIBarButtonItem(imageName: "home_newSaoicon", highImage: "home_newSeacrhcon", size: size)
        
        
        navigationItem.rightBarButtonItems=[historyItem,searchItem,qrcodeItem]

    
    }
}