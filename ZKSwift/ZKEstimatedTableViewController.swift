//
//  ZKEstimatedTableViewController.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/6.
//  Copyright © 2016年 ZK. All rights reserved.
//
//
//  Auto Layout的一些处理 自适应行高
//

import UIKit


class ZKEstimatedTableViewController:  ZKStyleTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        //此值可以是任何值，影响不大 子类可以自己重新赋值，越接近行高越好
        self.tableView.estimatedRowHeight = 100.0;
    }
}
