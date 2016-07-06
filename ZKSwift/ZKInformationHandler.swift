//
//  ZKInformationHandler.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/4.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit
import SwiftyJSON

class ZKInformationHandler: ZKAlamofireHandler {
    
    
    override func jsonToModel(json: JSON) -> Array<AnyObject>? {
        let data = (json["data"] as JSON).rawValue;
        
        let infor = ZKInformationModel.jsonToModelList( data ) as! Array<ZKInformationModel>
        
        var tempA : Array<AnyObject> = Array();
        
        for ifo in infor {
            ifo.cellClass = ZKInformationTableViewCell.self;
            ifo.isloadNib = true;
            tempA.append([ifo]);
        }
        
        print("JSON:\(infor)");
        
        return tempA;
    }

}
