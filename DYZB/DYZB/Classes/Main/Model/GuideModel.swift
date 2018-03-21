//
//  GuideModel.swift
//  DYZB
//
//  Created by 李孔文 on 2018/2/13.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

import UIKit

class GuideModel: NSObject {
    
    var guideImage : String = ""
    
    //字典转模型
    init(dict:[String:AnyObject]) {
        super.init()
        guideImage = dict["guideImage"] as! String
    }
    override func setValue(_ value: Any?, forKey key: String) {
        
    }
}
