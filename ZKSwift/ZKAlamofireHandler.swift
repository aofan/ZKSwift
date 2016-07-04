//
//  ZKAlamofireHandler.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/4.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ZKAlamofireHandler: NSObject {
    
    typealias requestFinish = ()->Void;
    
    /// 返回的模型数组
    var dataArray : Array<AnyObject>?;
    
    /**
     网络请求处理
     
     - parameter urlString:  url地址
     - parameter parameters: 参数
     */
    func alamofireBaseHandler( requestfinish : requestFinish?, urlString : String, parameters: [String: AnyObject]? = nil){
    
        Alamofire.request(.GET, "http://news.jrj.com.cn/json/itougu/getIndexNews?date=(null)&size=10", parameters: ["d":"b"]).responseJSON { (response) in
            
            switch response.result{
            case .Success:
                
                let value = response.result.value
                
                let json = JSON(value!);
                
                self.dataArray = self.jsonToModel(json);
                
                requestfinish?();
                
            case .Failure(let error):
                
                print(error)
                
            }
        }
    }
    
    
    /**
     返回对应的模型 此方法必须重写  否则返回nil
     
     - parameter json: 后台返回的json数据类型
     
     - returns: 对应的模型数组
     */
    func jsonToModel( json : JSON )->Array<AnyObject>?{
        return nil;
    }
    

}




