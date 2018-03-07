//
//  AnchorModel.swift
//  DYZB
//
//  Created by 李孔文 on 2018/3/4.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {
    
    //房间ID
    var name_id : Int = 0
    var vertical_src = ""
    var isVertical : Int = 0
    
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forKey key: String) {
        
    }


}
