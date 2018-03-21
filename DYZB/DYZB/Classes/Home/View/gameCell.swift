//
//  gameCell.swift
//  DYZB
//
//  Created by 李孔文 on 2018/3/11.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

import UIKit

class gameCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconLableView: UILabel!
    //定义模型
    var model : GuideModel?{
        didSet{
            
        }
    }
    //系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
