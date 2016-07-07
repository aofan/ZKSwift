//
//  ZKStyleTableViewController.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/7.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit

class ZKStyleTableViewController: ZKRequestTableViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad();
        
        self.tableView.frame = self.view.frame;
        //设置tableView的背景颜色
        self.tableView.backgroundColor = UIColor.init(colorLiteralRed: 0.960784316, green: 0.960784316, blue: 0.960784316, alpha: 1);
        
        //去掉多余的空白行
        self.tableView.tableFooterView = UIView(frame: CGRectZero);
    }

}
