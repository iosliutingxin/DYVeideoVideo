//
//  RecommendCycle.swift
//  DYZB
//
//  Created by 李孔文 on 2018/3/6.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//


//注意
//去掉xib的autolayout和autosizing不要他随父控件的拉伸而拉伸
import UIKit
private let cycleId = "cycleId"

class RecommendCycle: UIView {
    //控件属性
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.autoresizingMask = UIViewAutoresizing(rawValue: 0)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cycleId)
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true

    }
    
    override func layoutSubviews() {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize=(self.bounds.size)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
    }

}

extension RecommendCycle{
    //提供一个快速创建View的类方法
  class func createCycleView() -> RecommendCycle {
        return Bundle.main.loadNibNamed("RecommendCycle", owner: nil, options: nil)?.first as! RecommendCycle
    }
}

//遵守数据源方法
extension RecommendCycle : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cycleId, for: indexPath)
        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.red : UIColor.blue
        
        return cell
    }
    
    
}
