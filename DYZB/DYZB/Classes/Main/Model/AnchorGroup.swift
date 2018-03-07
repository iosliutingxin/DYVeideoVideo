//
//  AnchorGroup.swift
//  DYZB
//
//  Created by 李孔文 on 2018/3/4.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

import UIKit

//采用kvc的方式设置模型
class AnchorGroup: NSObject {
    //主播模型数组
    fileprivate lazy var anchorArray : [AnchorModel] = [AnchorModel]()
    //该组中的房间信息
    var room_list : [[NSString : NSObject]]?{
        didSet{
            guard let room_list = room_list else {return}
            for dict in room_list{
                let group = AnchorModel(dict: dict as [String : AnyObject])
                self.anchorArray.append(group)
                
            }
            
        }
    }
    
    //组显示的标题
    var tag_name : String = ""
    //组显示的图标
    var icon_name : String = ""
    //字典转模型
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forKey key: String) {

    }

}
