//
//  Eject01.swift
//  DYZB
//
//  Created by 李孔文 on 2018/2/26.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

import UIKit

class Eject01: UIView {

     var dataArray : NSArray = []
     var baseView : UIView = UIView()
     var closeButtonView : UIView = UIView()
     var closeButton : UIButton = UIButton()
     var grayView : UIView = UIView()

}

//功能扩展
extension Eject01 {
    
    func setTitle(titleStr : NSString , dataArr : NSArray) {
        
        self.frame = CGRect(x: 0, y: 0, width: screenW, height: screenH)
        
        self.dataArray = dataArr
        self.grayView.frame = CGRect(x: 0, y: 0, width: screenW, height: screenH)
        self.grayView.backgroundColor = UIColor.black
        self.grayView.alpha = 0.7
        self.grayView.isUserInteractionEnabled = true
        self.addSubview(self.grayView)

        // 当前顶层窗口
        let wind = UIApplication.shared.delegate?.window
        wind!?.addSubview(self)
        
        //显示视图
        self.baseView.frame = CGRect(x: 23, y: 0, width: Int(screenW-59), height: dataArray.count*57+106)
        self.baseView.center = CGPoint(x: screenW/2, y: screenH/2)
        self.baseView.layer.masksToBounds = true
        self.baseView.layer.cornerRadius = 9
        self.baseView.backgroundColor = UIColor.red
        self.addSubview(self.baseView)
        
        //titleLab
        let titlelable = UILabel()
        titlelable.frame = CGRect(x: 0, y: 0, width: screenW-59, height: 40)
        titlelable.text = titleStr as String
        titlelable.textAlignment = .center
        titlelable.font = UIFont.systemFont(ofSize: 23.0)
        titlelable.backgroundColor = UIColor.white
        self.baseView .addSubview(titlelable)
        
        //关闭按钮
        self.closeButtonView.frame =  self.baseView.bounds
        self.closeButtonView.center = CGPoint(x: screenW/2, y: screenH/2)
        self.closeButtonView.backgroundColor = UIColor.clear

        self.addSubview(self.closeButtonView)
        
        self.closeButton.frame = CGRect(x: screenW-72, y: -13, width: 26, height: 26)
        self.closeButton.setImage(UIImage (named: "iocn_memberClose"), for: .normal)
        self.closeButtonView.addSubview(self.closeButton)
        
        
    }
    
    
    func tapClose()  {
        print("hello")
    }
  
    
 
}


