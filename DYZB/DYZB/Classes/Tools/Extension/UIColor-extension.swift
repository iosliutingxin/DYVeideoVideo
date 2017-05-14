//
//  UIColor-extension.swift
//  DYZB
//
//  Created by 北京时代华擎 on 17/5/7.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

import UIKit

extension UIColor {

    convenience init(r :CGFloat, g : CGFloat ,b :CGFloat){

        self.init(red : r/255.0, green :b/255.0, blue :b/255.0 ,alpha :1 )
    
    }
}