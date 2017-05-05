//
//  UIBarButton-Extension.swift
//  DYZB
//
//  Created by 北京时代华擎 on 17/4/30.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

import UIKit

extension UIBarButtonItem {

    
//构造类方法
/*
    class func createItem(imageName:String,highImage:String,size:CGSize)->UIBarButtonItem
    {
        
        let qrcode=UIButton()
        qrcode.setImage(UIImage(named: imageName), forState: .Normal)
        qrcode.setImage(UIImage(named: highImage), forState: .Highlighted)
        qrcode.frame=CGRect(origin: CGPointZero, size: size)
        
         return UIBarButtonItem(customView: qrcode)

    }*/
    
//便利构造函数：1、convenience开头 2、在构造函数中必须明确调用一个设计构造函数
    convenience init(imageName:String,highImage:String,size:CGSize) {
        
        let qrcode=UIButton()
        qrcode.setImage(UIImage(named: imageName), forState: .Normal)
        qrcode.setImage(UIImage(named: highImage), forState: .Highlighted)
        qrcode.frame=CGRect(origin: CGPointZero, size: size)
        self.init(customView:qrcode)
    }
    
}