//
//  ZKBaseHandler.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/7.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit


public class ZKBaseHandler: NSObject {
    
    /// 请求完成
    public typealias requestFinish = ()->Void;
    
    /// 返回的模型数组
    public var dataArray : Array<AnyObject>?;
    
    /// 网络请求返回结果
    public var requestResult : AlamofireRequestResult?;

}



/**
 网络请求返回的类型
 
 - AlamofireRequestSuccess: 请求成功
 - AlamofireRequestFail:    请求失败 没请求到(网络或者地址问题)
 */
public enum AlamofireRequestResult : Int {
    
    case AlamofireRequestSuccess
    case AlamofireRequestFail
}

