//
//  ZKInformationTableViewCell.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/5.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit

class ZKInformationTableViewCell:  ZKBaseTableViewCell{
    
    @IBOutlet weak var titleView: UILabel!
    
    override func updateSourceForCell(source: AnyObject) {
        let infor = source as! ZKInformationModel;
        self.titleView.text = infor.title;
    }

}
