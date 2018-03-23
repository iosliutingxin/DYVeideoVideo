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
private let itemWeight : CGFloat = (screenW - 2 * edgeMargin) / 3
private let itemHeight : CGFloat = itemWeight * 6 / 5
private let ItemheaderH : CGFloat = 50
private let headerViewID = "headerViewID"
private let recommeGameHeight : CGFloat = 90

class gameController: UIViewController {


    //懒加载游戏推荐
    fileprivate lazy var topView : CollectionHeaderView = {
        let topView = CollectionHeaderView.createCycleView()
        topView.frame = CGRect(x: 0, y: -(ItemheaderH + recommeGameHeight), width: screenW, height: itemHeight - 1)
        return topView
    }()
    fileprivate lazy var recommeGame : recomeGameView = {
        let recommeGame = recomeGameView.createCycleView()
        recommeGame.frame = CGRect(x: 0, y: -recommeGameHeight, width: screenW, height: recommeGameHeight)
        return recommeGame
        
    }()

    //UICollection
    fileprivate lazy var conllection : UICollectionView = {[weak self] in
        //流水布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemWeight, height: itemHeight)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.headerReferenceSize = CGSize(width: screenW, height: ItemheaderH)

        
        let conllection = UICollectionView(frame: (self?.view.bounds)!, collectionViewLayout: layout)

        conllection.register(UINib(nibName: "gameCell", bundle: nil), forCellWithReuseIdentifier: cellID)
        conllection.dataSource = self
        //适配屏幕
        conllection.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        conllection.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerViewID)

        return conllection
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        


    }
}

//设置UI
extension gameController {
    func setUI() {
        //1.加载UICOllectionView
        view.addSubview(conllection)
        
        //2、加载推荐
        conllection.addSubview(topView)
        conllection.addSubview(recommeGame)
        
        //3、设置collection内边距
        conllection.contentInset = UIEdgeInsets(top: ItemheaderH + recommeGameHeight, left: 0, bottom: 0, right: 0)

    }
}

//UICollectionViewDataSource---
extension gameController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! gameCell
        cell.iconLableView.text = "第\(indexPath.row)个"
        
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerViewID, for: indexPath)
        return headview
    }
}
