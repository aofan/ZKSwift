//
//  ZKBaseModel.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/4.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit
import D3Model

@objc(ZKBaseModel)
public class ZKBaseModel:  D3Model{
    /// 模型对应的cell展示类
    var cellClass : AnyClass?;
    /// 是否加载xib
    var isloadNib = false;
    
}
