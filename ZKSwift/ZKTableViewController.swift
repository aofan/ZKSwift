
//  ZKTableViewController.swift
//  ZKSwift
//
//  Created by lizhikai on 16/6/26.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit

class ZKTableViewController: ZKEstimatedTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.isGroup = true;
        self.baseDataHandler = ZKInformationHandler();
        loadListRequest();
        
        clearBackBarButtonItemTitle()
        
        
    }
    
    func clearBackBarButtonItemTitle(){
        let returnButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ZKTableViewController.backButtonClick))
        
        self.navigationItem.backBarButtonItem = returnButtonItem;
        
    }
    
    func backButtonClick() {
        print("aaaaaaaaaaaaaa")
    }
    
    override func loadListRequest() {
        super.loadListRequest();
        loadList(self.isFirstRequest);
    }
    
    override func loadMoreListRequest() {
        super.loadMoreListRequest();
        loadList(self.isFirstRequest);
    }
    
    func loadList(isFirstRequest : Bool){
        let urlString = "http://news.jrj.com.cn/json/itougu/getIndexNews";
        
        let parameters = ["data":"null","size":"10","d":"b"];
    
        self.baseDataHandler?.alamofireToJSONHandler( loadFinish, urlString: urlString, parameters: parameters, isFirstRequest: isFirstRequest);
    }
    
    
    func loadFinish(){
        self.dataArray = self.baseDataHandler?.dataArray;
        super.loadAllFinish();
    }
    
    override func cellEventHandler(source: ZKBaseModel, cell: ZKBaseTableViewCell?, target: AnyObject?, indexPath: NSIndexPath?) {
        let model = source as! ZKInformationModel;
        print(model.listdate)
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10;
    }

}
