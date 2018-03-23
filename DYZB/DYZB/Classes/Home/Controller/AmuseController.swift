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
private let ItemheaderH : CGFloat = 50
private let headerViewID = "headerViewID"
private let recommeGameHeight : CGFloat = 90

class AmuseController: UIViewController {
    
    
  
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


extension AmuseController {
    func setUI() {
        //1.加载UICOllectionView
        view.addSubview(conllection)
        
        //2、加载推荐
        
        //3、设置collection内边距
        conllection.contentInset = UIEdgeInsets(top: recommeGameHeight, left: 0, bottom: 0, right: 0)
        
    }
}

//-----------------------------UICollectionViewDataSource---
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

