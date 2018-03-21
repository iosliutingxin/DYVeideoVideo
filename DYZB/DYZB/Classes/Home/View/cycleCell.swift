//
//  cycleCell.swift
//  DYZB
//
//  Created by 李孔文 on 2018/3/9.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

import UIKit

class cycleCell: UICollectionViewCell {

    @IBOutlet weak var cycleImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
  weak  var model : GuideModel! {
        didSet{
            guard model != nil else {
                return
            }
            cycleImage.image = UIImage(named:model.guideImage)
            
    }}

}
