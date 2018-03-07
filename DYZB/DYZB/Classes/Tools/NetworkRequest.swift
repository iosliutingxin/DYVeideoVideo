//
//  NetworkRequest.swift
//  DYZB
//
//  Created by 李孔文 on 2018/3/1.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

import UIKit
import Alamofire
class NetworkRequest: NSObject {

  class  func requestData(urlString : String ,parameters : [String : AnyObject]?=nil , finishedback : @escaping (_ resultresult : AnyObject) -> ()) {

        Alamofire.request(urlString, method: .get, parameters: parameters, encoding: JSONEncoding.default)
        .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
            print("进度: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                return .success
            }
            .responseJSON { response in
                
                guard let data = response.data else{
                    
                    debugPrint("请求失败")
                    return
                }
                finishedback(data as AnyObject)
        }
        
     
    }
}
