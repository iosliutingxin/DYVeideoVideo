//
//  CollectionGuideCell.swift
//  DYZB
//
//  Created by 李孔文 on 2018/2/13.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

import UIKit

class CollectionGuideCell: UICollectionViewCell {

    @IBOutlet weak var guideImage: UIImageView!
    @IBOutlet weak var pageController: UIPageControl!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.frame =  CGRect(x: 0, y: stateBarH + NavigationBar , width: screenW, height: 111)
        
    }
    weak var model : GuideModel!{
        didSet{
            guard let image = model.guideImage else{
                return
            }
            guideImage.image = UIImage(named: image)
            
        }
        
    }
    
    

}


