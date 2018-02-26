//
//  Eject01.swift
//  DYZB
//
//  Created by 李孔文 on 2018/2/26.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

import UIKit

class Eject01: UIView {

    fileprivate var dataArray : NSArray = []
    fileprivate var baseView : UIView = UIView()
    fileprivate var closeButtonView : UIView = UIView()
    fileprivate var closeButton : UIButton = UIButton()
    fileprivate var grayView : UIView = UIView()

}

//功能扩展
extension Eject01 {
    
    func setTitle(titleStr : NSString , dataArr : NSArray) {
        print("----titleStr\(titleStr)")
    }
}
