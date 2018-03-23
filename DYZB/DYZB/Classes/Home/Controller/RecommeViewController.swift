//
//  RecommeViewController.swift
//  DYZB
//
//  Created by 李孔文 on 2018/2/11.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

import UIKit
private let ItemMargin : CGFloat = 10
private let ItemW = (screenW - ItemMargin*3) / 2
private let ItemH = ItemW * 3 / 4
private let normalCell = "normalCell"
private let headerViewID = "headerViewID"
private let ItemheaderH : CGFloat = 50
private let cycleHeight = screenH * 3 / 8
private let recommeGameHeight : CGFloat = 90

class RecommeViewController: UIViewController {
    
    
    //懒加载UICollectionView
    fileprivate lazy var recommeMV : RecommeModel = RecommeModel()
    //懒加载无线滚动View
    fileprivate lazy var recommeCycle : RecommendCycle = {
        let cycleView = RecommendCycle.createCycleView()
        cycleView.frame = CGRect(x: 0, y: -(cycleHeight + recommeGameHeight), width: screenW, height: cycleHeight)
        return cycleView
        
    }()
    //懒加载游戏推荐
    fileprivate lazy var recommeGame : recomeGameView = {
        let recommeGame = recomeGameView.createCycleView()
        recommeGame.frame = CGRect(x: 0, y: -recommeGameHeight, width: screenW, height: recommeGameHeight)
        return recommeGame
        
    }()
    fileprivate lazy var collection : UICollectionView = {[unowned self] in
        
        //1、创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: ItemW, height: ItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = ItemMargin
        layout.sectionInset = UIEdgeInsets(top: 0, left: ItemMargin, bottom: 0, right: ItemMargin)
        layout.headerReferenceSize = CGSize(width: screenW, height: ItemheaderH)
        
        
        //2、创建UICollectionView
        let collection = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collection.backgroundColor = UIColor.yellow
        //3、注册cell
        //(1、普通cell注册 collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: normalCell)
        
        collection.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: normalCell)
        //4、注册headView
        //（1、普通注册 collection.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerViewID)
        //(2、取xib注册
        collection.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerViewID)
        //5、设置属性让collectionview随父控件的拉伸而拉伸
        collection.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        collection.dataSource = self
        return collection
        
        
    }()

    //回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        loadData()
    }
}

//设置UI
extension RecommeViewController{
    
    fileprivate func setUI(){
        //1、将collection添加到控制器的View当中
        view.addSubview(collection)
        
        //2、将无线轮播图添加到collection中
        collection.addSubview(recommeCycle)
        
        //3、游戏推荐页面
        collection.addSubview(recommeGame)
        
        //4、给collection设置内边距--用来放置广告窗
        collection.contentInset = UIEdgeInsets(top: cycleHeight + recommeGameHeight, left: 0, bottom: 0, right: 0)
        
       
        
    }
}

//发送网络请求
extension RecommeViewController{
    
    func loadData(){
        recommeMV.requestData()
        recommeMV.requestCycle()
        //4、给轮播传送数据
        recommeCycle.data = recommeMV.cycleGroup
    }
    
}

extension RecommeViewController : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if  section == 0 {
            return 8
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1、获取cell
        let cell = collection.dequeueReusableCell(withReuseIdentifier: normalCell, for: indexPath)        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
         let headview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerViewID, for: indexPath)
        return headview
    }
}


