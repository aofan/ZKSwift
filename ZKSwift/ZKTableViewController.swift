//
//  ZKTableViewController.swift
//  ZKSwift
//
//  Created by lizhikai on 16/6/26.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit

class ZKTableViewController: UITableViewController {
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text = "lidan";
        return cell;
    }

}
