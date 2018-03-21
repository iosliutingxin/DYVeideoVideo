//
//  recomeGameView.swift
//  DYZB
//
//  Created by 李孔文 on 2018/3/11.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

import UIKit
private var cellID  = "recomeGameID"
private var EdgeInsertMargin : CGFloat = 10

class recomeGameView: UIView {

    @IBOutlet weak var collection: UICollectionView!
    override func awakeFromNib() {
        //不随父控件的拉伸而拉伸
        self.autoresizingMask = UIViewAutoresizing(rawValue: 0)
        //普通注册
//        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
        collection.register(UINib(nibName: "gameCell", bundle: nil), forCellWithReuseIdentifier: cellID)
        //设置内边距
        collection.contentInset = UIEdgeInsetsMake(0, EdgeInsertMargin, 0, EdgeInsertMargin)
        collection.dataSource = self
        
    }

}

//类扩展
extension recomeGameView{
    //提供一个快速创建View的类方法
    class func createCycleView() -> recomeGameView {
        return Bundle.main.loadNibNamed("recomeGameView", owner: nil, options: nil)?.first as! recomeGameView
    }
}


//遵守数据源方法
extension recomeGameView : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! gameCell
        return cell
    }
}
