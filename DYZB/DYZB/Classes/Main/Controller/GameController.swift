//
//  GameController.swift
//  DYZB
//
//  Created by 李孔文 on 2018/2/12.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

import UIKit
import CoreLocation

class GameController: UIViewController {

    //1.初始化定位管理器
    let locationManager:CLLocationManager = CLLocationManager()
    /** 定位的当前国家 */
    fileprivate var _strCurrentCountry:String? = "中国";
    var strCurrentCountry:String? {
        return _strCurrentCountry;
    }
    
    /** 定位的当前省份 */
    fileprivate var _strCurrentProvince:String?;
    var strCurrentProvince:String? {
        return _strCurrentProvince;
    }
    
    /** 定位的当前城市 */
    fileprivate var _strCurrentCity:String? = "上海";
    var strCurrentCity:String? {
        return _strCurrentCity;
    }
    
    /** 定位的当前城市所在的区(eg:普陀) */
    fileprivate var _strCurrentArea:String?;
    var strCurrentArea:String? {
        return _strCurrentArea;
    }
    
    /** 定位的当前详细信息 */
    fileprivate var _strCurrentAddress:String?;
    var strCurrentAddress:String? {
        return _strCurrentAddress;
    }
    
    
    //系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        initLocationManger()

    }
}

//定位设置
extension GameController{
    
    func initLocationManger()  {
        
        //设置定位服务管理器代理
        locationManager.delegate = self
        //设置定位进度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //最佳定位
        //更新距离
        locationManager.distanceFilter = 100
        //发出授权请求
//        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if (CLLocationManager.locationServicesEnabled()){
            //允许使用定位服务的话，开始定位服务更新
            locationManager.startUpdatingLocation()
            print("定位开始")
            
        }
    }
}

extension GameController : CLLocationManagerDelegate{
    
    //开始定位，获取经纬度信息
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
      /*
        //获取最新的坐标
        var currLocation : CLLocation = locations.last!  // 持续更新
        // 获取经纬度
        let latitude = "纬度:\(currLocation.coordinate.latitude)"
        let  longitude = "纬度:\(currLocation.coordinate.longitude)"
        //获得海拔
        let   alttude = "海拔:\(currLocation.altitude)"
        //获取水平精度
        let  horizontal = "水平精度:\(currLocation.horizontalAccuracy)"
        //获取垂直精度
        let  vartical = "垂直精度:\(currLocation.verticalAccuracy)"
        //获取方向
        let  course = "方向:\(currLocation.course)"
        //获取速度
        let speed = "速度:\(currLocation.speed)"
    */
        
        // [S] 反编码以便获取其他信息
        let geoCoder:CLGeocoder = CLGeocoder.init()
        geoCoder.reverseGeocodeLocation(locations.last!, completionHandler: {(placemarks,error) in
            
            // 如果断网或者定位失败
            if placemarks == nil{
                return
            }
            let placeMark:CLPlacemark = placemarks![0];
            
            //当前城市(把"市"过滤掉,否则 和 其他界面城市不匹配)
            self._strCurrentCity = placeMark.locality?.replacingOccurrences(of: "市", with: "")
            
            //详细地址
            self._strCurrentAddress = placeMark.addressDictionary?["FormattedAddressLines"] as? String
            
            //国家
            self._strCurrentCountry = placeMark.addressDictionary?["Country"] as? String;
            
            //省份
            self._strCurrentProvince = placeMark.addressDictionary?["State"] as? String
            
            //区
            self._strCurrentArea = placeMark.addressDictionary?["SubLocality"] as? String
            
            print("国家:\(String(describing: self._strCurrentCountry))--省份:\(String(describing: self._strCurrentProvince))--当前城市\(String(describing: self._strCurrentCity))--区:\(String(describing: self._strCurrentArea))")

        
        });

    }
    
    
    
    
   
}
