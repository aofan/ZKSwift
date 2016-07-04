//
//  ZKBaseTableViewController.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/4.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit

class ZKBaseTableViewController: UITableViewController {
    
    
    var baseDataHandler : ZKAlamofireHandler?;
    
    var dataArray : Array<AnyObject>?;
    
    
    /**
     请求数据  要求子类实现
     */
    func loadListRequest(){}

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ((self.dataArray?.count) == nil) {
            return 0;
        }
        
        return (self.dataArray?.count)!;
    }
    
}
