//
//  GuideController.swift
//  DYZB
//
//  Created by 李孔文 on 2018/2/13.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

import UIKit
private let ItemMargin : CGFloat = 10
private let ItemW = (screenW - ItemMargin*3) / 2
private let ItemH = ItemW * 3 / 4
private let GuideCell = "CollectionGuideCell"
private let ItemheaderH : CGFloat = 50

class GuideController: UIViewController {

    //系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        setUI()
    }
    //导航图片数据
    fileprivate var guideArr : NSMutableArray = {
        var guideArr = NSMutableArray()
        //1、导航页数据
        var guideImages = ["bg_GuideIndex1_6","bg_GuideIndex2_6","bg_GuideIndex3_6","bg_GuideIndex4_6"]
        //2、数据转模型
        for var image in guideImages{
            
            var  model  = GuideModel()
            model.guideImage = image
            //3、模型存数组
            guideArr.add(model)
        }
        
        return guideArr
    }()
    //懒加载UICollectionView
    fileprivate lazy var collection : UICollectionView = {[unowned self] in
        
        //1、创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenW, height: screenH)
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        //2、创建UICollectionView
        let contentH = screenH - stateBarH - NavigationBar  - tabBarH 
        let contentFrame = CGRect(x: 0, y: stateBarH + NavigationBar , width: screenW, height: contentH)
        let collection = UICollectionView(frame: contentFrame, collectionViewLayout: layout)
        collection.backgroundColor = UIColor.yellow
        collection.isPagingEnabled = true
        //3、注册cell
        //(1、普通cell注册 collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: normalCell)
        collection.register(UINib(nibName: "CollectionGuideCell", bundle: nil), forCellWithReuseIdentifier: GuideCell)
        //5、设置属性让collectionview随父控件的拉伸而拉伸
//        collection.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        collection.dataSource = self
        return collection
        }()
}

extension GuideController : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return guideArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1、获取cell
        let cell = collection.dequeueReusableCell(withReuseIdentifier: GuideCell, for: indexPath) as! CollectionGuideCell
        //2、模型数据传送到cell中进行处理
        cell.model = guideArr[indexPath.row] as! GuideModel
        return cell
    }
}

//设置UI
extension GuideController{
    
    fileprivate func setUI(){
        
        view.addSubview(collection)
        
    }
}

