//
//  NSDate_Extension.swift
//  DYZB
//
//  Created by 李孔文 on 2018/3/3.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

import Foundation

//类方法
 func getCurrentTime() ->String{
    
    
    let now = Date()
    let timeInterval:TimeInterval = now.timeIntervalSince1970
    let timeStamp = String(timeInterval)
    print("当前时间的时间戳：\(timeStamp)")
    
    return timeStamp
}

