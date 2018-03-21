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
    
    public var currentIndex : Int = 0{
        didSet{
            setCurrentIndex(index: currentIndex)
        }
    }

//懒加载属性
    fileprivate lazy var pageTitleView:PageTitleView = {[weak self] in
    
        let titleFrame=CGRect(x: 0, y: stateBarH+NavigationBar, width:screenW, height: titleViewH)
        let titles=["推荐","游戏","娱乐","趣玩"]
        let titleView=PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate=self
        return titleView
    
    }()
    
//内容部分
    fileprivate lazy var pageContentView : PageContentView = {[weak self]in
//1、确定frame
        let contentH = screenH - stateBarH - NavigationBar - titleViewH - tabBarH
        let contentFrame = CGRect(x: 0, y: stateBarH + NavigationBar + titleViewH, width: screenW, height: contentH)
//2、确定所有子控制器
        var childVc = [UIViewController]()
        //（1--推荐控制器
        childVc.append(RecommeViewController())
        //（2--游戏控制器
        childVc.append(gameController())

        for _ in 0..<2{
        
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVc.append(vc)
        }
    
        let contentView = PageContentView(frame: contentFrame, chilVcs: childVc, parentViewController: self)
        contentView.ContentCurrentPage = {[weak self] (index)in
            guard let strongSelf = self else {
                return
            }
            strongSelf.currentIndex = index
        }
        return contentView
    }()
    
//系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()

       }
    

}
//设置UI界面
extension HomeViewController{

    fileprivate func setUpUI(){
//不需要调整UIscrollView的内边距
        automaticallyAdjustsScrollViewInsets=false
        
//1、设置导航栏
        setUpNavigationBar()
        
//2、添加titlview
        view.addSubview(pageTitleView)
        
//3、添加contentView
        
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.purple
    
    }
    
    fileprivate func setUpNavigationBar(){
        
        let btn=UIButton()
        btn.setImage(UIImage (named: "homeLogoIcon"), for:UIControlState() )
        btn.sizeToFit()
        navigationItem.leftBarButtonItem=UIBarButtonItem(customView: btn)
    
        
        let size=CGSize(width: 40, height: 40)

        let historyItem=UIBarButtonItem(imageName: "btn_close_danmu", highImage: "btn_close_danmu", size: size)
        

        let searchItem=UIBarButtonItem(imageName: "home_newSeacrhcon", highImage: "home_newSaoicon", size: size)
        

        let qrcodeItem=UIBarButtonItem(imageName: "home_newSaoicon", highImage: "home_newSeacrhcon", size: size)
        
        
        navigationItem.rightBarButtonItems=[historyItem,searchItem,qrcodeItem]

    
    }
}

extension HomeViewController{
    
    func setCurrentIndex(index : Int)  {
        pageTitleView.setCurrentId(index)
    }
}

//pageTitleDelegate
extension HomeViewController : pageTitleDelegate {

    func pageTitleView(_ titleView: PageTitleView, selectedIndex index: Int) {
        
        pageContentView.setCurrentIndex(index)
        
    }
    
 
}



