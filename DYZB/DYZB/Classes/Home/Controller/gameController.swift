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

class gameController: UIViewController {


    fileprivate lazy var conllection : UICollectionView = {[weak self] in
        //流水布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemWeight, height: itemHeight)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        
        let conllection = UICollectionView(frame: (self?.view.bounds)!, collectionViewLayout: layout)

        conllection.register(UINib(nibName: "gameCell", bundle: nil), forCellWithReuseIdentifier: cellID)
        conllection.dataSource = self
        return conllection
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        


    }
}


extension gameController {
    //1.加载UICOllectionView
    func setUI() {
        view.addSubview(conllection)

    }
}

//-----------------------------UICollectionViewDataSource---
extension gameController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
}
