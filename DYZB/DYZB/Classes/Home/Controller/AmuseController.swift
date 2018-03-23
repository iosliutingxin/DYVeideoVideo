//
//  gameController.swift
//  DYZB
//
//  Created by 李孔文 on 2018/3/21.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

import UIKit
private let cellID = "gameCell"
private let edgeMargin : CGFloat = 10
private let itemWeight : CGFloat = (screenW - 3 * edgeMargin) / 2
private let itemHeight : CGFloat = itemWeight * 6 / 5
private let ItemheaderH : CGFloat = 10
private let headerViewID = "headerViewID"
private let cycleHeight = screenW / 2 + 5

class AmuseController: UIViewController {
    
    // 1、导航窗口
    fileprivate lazy var advertisement : amuseAdvertisement = {
        var advertisement = amuseAdvertisement.createAdvertisement()
        
        advertisement.frame = CGRect(x: 0, y: -cycleHeight, width: screenW, height: cycleHeight)
        return advertisement
    }()
  
    //2、UICollection
    fileprivate lazy var conllection : UICollectionView = {[weak self] in
        //流水布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemWeight, height: itemHeight)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.headerReferenceSize = CGSize(width: screenW, height: ItemheaderH)
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: edgeMargin, bottom: 0, right: edgeMargin)

        let conllection = UICollectionView(frame: (self?.view.bounds)!, collectionViewLayout: layout)
        conllection.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: cellID)
        conllection.backgroundColor = UIColor.white
        conllection.dataSource = self

        //适配屏幕
        conllection.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
        return conllection
        
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        
        
        
    }
}

//设置UI
extension AmuseController {
    func setUI() {
        //1.加载UICOllectionView
        view.addSubview(conllection)
        
        //2、加载推荐
        
        /**--------------------注意-------------------------------
        做推荐界面的时候因为用到横向排序，所以使用了两级cell，
        1.首先在View上添加一个UICollectionView，分两个section，每个section上面有一个cell
        2、在cell上面在次添加UICollection，在此UICollection上进行最终设置
       */
        conllection.addSubview(advertisement)
        
        //3、设置collection内边距
        conllection.contentInset = UIEdgeInsets(top: cycleHeight, left: 0, bottom: 0, right: 0)
        
    }
}

//UICollectionViewDataSource---
extension AmuseController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
    
  
    
}

