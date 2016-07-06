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
    
    @IBOutlet weak var btnView: UIButton!
    override func updateSourceForCell(source: AnyObject) {
        let infor = source as! ZKInformationModel;
        self.titleView.text = infor.title;
    }

    @IBAction func btnClickHandler(sender: AnyObject) {
        
        cellEventHandler!( source: source as!ZKBaseModel, cell: self , target: nil , indexPath: self.indexPath );
    }
}
