//
//  CollectionHeaderView.swift
//  DYZB
//
//  Created by 李孔文 on 2018/2/11.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
extension CollectionHeaderView{
    //提供一个快速创建View的类方法
    class func createCycleView() -> CollectionHeaderView {
        return Bundle.main.loadNibNamed("CollectionHeaderView", owner: nil, options: nil)?.first as! CollectionHeaderView
    }
}

