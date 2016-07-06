//
//  ZKInformationTableViewCell.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/5.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit

class ZKInformationTableViewCell:  ZKBaseTableViewCell{
    
    override func updateSourceForCell(source: AnyObject) {
        let infor = source as! ZKInformationModel;
        self.textLabel?.text = infor.title;
    }

}
