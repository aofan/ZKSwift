//
//  ZKTableViewController.swift
//  ZKSwift
//
//  Created by lizhikai on 16/6/26.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import D3Model

class ZKTableViewController: ZKBaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.baseDataHandler = ZKInformationHandler();
        loadListRequest();
    }
    
    override func loadListRequest() {
        let urlString = "http://news.jrj.com.cn/json/itougu/getIndexNews";
        
        let parameters = ["data":"null","size":"10","d":"b"];
        
        [self.baseDataHandler! .alamofireBaseHandler(loadFinish,urlString: urlString, parameters: parameters)];
    }
    
    
    func loadFinish(){
        self.dataArray = self.baseDataHandler?.dataArray;
        self.tableView.reloadData();
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text = (self.dataArray![indexPath.row] as! ZKInformationModel).title;
        return cell;
    }

}
