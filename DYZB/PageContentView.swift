//
//  PageContentView.swift
//  DYZB
//
//  Created by 北京时代华擎 on 17/5/7.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

import UIKit

private let contentCellID = "contentCellID"

class PageContentView: UIView {
    
//2、定义属性
    private var chilVcs : [UIViewController]
    private var parentViewController : UIViewController
    
//懒加载属性
    private lazy var collectionView : UICollectionView = {
    
//1,创建layout
      let  layout = UICollectionViewFlowLayout()
      layout.itemSize=self.bounds.size
      layout.minimumInteritemSpacing = 0
      layout.minimumLineSpacing = 0
      layout.scrollDirection = .Horizontal
        
        
//2、创建uicollectionview
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.pagingEnabled = true
        collectionView.bounces = false
        collectionView.dataSource = self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: contentCellID)

        return collectionView
    }()

//1、构造函数
    
    init(frame: CGRect,chilVcs : [UIViewController],parentViewController : UIViewController) {
        
        
        self.chilVcs=chilVcs
        self.parentViewController=parentViewController
        
        super.init(frame : frame)
        
        setupUI()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//设置UI布局
extension PageContentView {

    private func setupUI(){
        
//1、将子控制器添加到父控制器中
        
        for chilVcv in chilVcs {
        
        parentViewController.addChildViewController(chilVcv)
        
        }
    
//    2、添加UIcollectionview，用于在cell中存放控制器view
        addSubview(collectionView)
        collectionView.frame = bounds
    }
}


extension PageContentView : UICollectionViewDataSource {

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return   chilVcs.count
    }

    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//创建cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(contentCellID, forIndexPath: indexPath)
        
//給cell设置内容
        
        for view in cell.contentView.subviews {
        
            view.removeFromSuperview()
        
        }
        let chidVC = chilVcs[indexPath.item]
        chidVC.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(chidVC.view)
        return cell

    }

}
