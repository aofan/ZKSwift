//
//  ZKBaseTableViewCell.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/5.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit

@objc protocol ZKBaseTableViewCellSource{
    
    func updateSourceForCell( source : AnyObject);
}

class ZKBaseTableViewCell: UITableViewCell, ZKBaseTableViewCellSource {
    /// 数据模型
    var source:AnyObject?{
        didSet
        {
            self.updateSourceForCell(source!);
        }
    }
    
    /// 索引
    var indexPath : NSIndexPath?;
    
    /// cell的事件处理
    typealias cellFunc = ( source : ZKBaseModel, cell : ZKBaseTableViewCell? , target : AnyObject? , indexPath : NSIndexPath? ) -> Void;
    var cellEventHandler:cellFunc?;
    
    

    required override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    func updateSourceForCell( source : AnyObject){
        
    }
}


