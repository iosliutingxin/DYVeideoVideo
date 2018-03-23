//
//  amuseAdvertisement.swift
//  DYZB
//
//  Created by 李孔文 on 2018/3/23.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

import UIKit
private let cellID = "bottomCell"

class amuseAdvertisement: UIView {
    @IBOutlet weak var collection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        //不随父控件的拉伸而拉伸
        self.autoresizingMask = UIViewAutoresizing(rawValue: 0)
        collection.dataSource = self
        collection.register(UINib(nibName: "bottomCell", bundle: nil), forCellWithReuseIdentifier: cellID)
        collection.isPagingEnabled = true
    }
    
    //设置宽高
    override func layoutSubviews() {
        let layout = collection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = self.bounds.size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
     
        
    }
}

extension amuseAdvertisement{
    
    //快速创建方法
    class func createAdvertisement() ->amuseAdvertisement{
        return  Bundle.main.loadNibNamed("amuseAdvertisement", owner: nil, options: nil)?.first as! amuseAdvertisement
    }
}

extension amuseAdvertisement : UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) 
        return cell
        
    }
}
