//
//  ZKBaseTableViewCell.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/5.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit

class ZKBaseTableViewCell: UITableViewCell {

    required override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateSourceForCell( source : AnyObject){
        
    }
}


