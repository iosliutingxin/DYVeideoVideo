//
//  RecommeModel.swift
//  DYZB
//
//  Created by 李孔文 on 2018/3/3.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

import UIKit

class RecommeModel: NSObject {

    //懒加载一个数组用于存放数据
    fileprivate lazy var anchorGroup : [AnchorGroup] = [AnchorGroup]()
    public lazy var cycleGroup : [GuideModel] = [GuideModel]()


}
//发送网络请求
extension RecommeModel{

    
    //请求滚动图片
    func requestCycle(){
        let arr = [["guideImage":"pullrefresh_0"],["guideImage":"pullrefresh_1"],["guideImage":"pullrefresh_2"],["guideImage":"pullrefresh_3"],["guideImage":"pullrefresh_4"],["guideImage":"pullrefresh_5"]]
        
        for dict in arr {
            let group = GuideModel(dict : dict as [String : AnyObject])
            self.cycleGroup.append(group)
        }
        
    }
    //请求推荐数据
    func requestData()  {
        
        //(1--创建一个组用于存放数据
        let disGroup = DispatchGroup()
        //(2--进入组
        disGroup.enter()
        //(3--离开组
        disGroup.leave()
        //(2--进入组
        disGroup.enter()
        //(3--离开组
        disGroup.leave()
        //(2--进入组
        disGroup.enter()
        //(3--离开组
        disGroup.leave()
        //(4--所有的组都请求到数据后进行排序
        disGroup.notify(queue: DispatchQueue.main) {
            print("hello world")
        }
        //1、请求第一部分数据
        
        
        //2、请求第二部分数据
        
        
        //3、请求第三部分数据
        let urlString = "http://rap.taobao.org/mockjs/16560/api/list"
        NetworkRequest.requestData(urlString: urlString, parameters: ["accessToken":"aaa" as AnyObject ,"page":"5" as AnyObject]) { (result) in
            
            //1、将result转成字典类型
            guard let resultDict = result as? [String : NSObject] else{return}
            
            //2、根据key值获取数据
            guard  let dataArray = resultDict["data"] as? [[NSString : NSObject]] else{return}
            
            //3、遍历数组，获取字典，并将字典转换为模型对象
            for dict in dataArray{
                let group = AnchorGroup(dict: dict as [String : AnyObject])
                self.anchorGroup.append(group)
                
            }}}
    
    
    
}
