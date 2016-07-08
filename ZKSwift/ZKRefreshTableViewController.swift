//
//  ZKRefreshTableViewController.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/8.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit
import XWSwiftRefresh

class ZKRefreshTableViewController: ZKBaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageNum = 1;
        self.tableView.headerView = XWRefreshNormalHeader(target: self, action: #selector(ZKRefreshTableViewController.upPullLoadData));
        self.tableView.footerView = XWRefreshAutoNormalFooter(target: self, action: #selector(ZKRefreshTableViewController.downPlullLoadData));
    }
    
    
    
    func upPullLoadData(){
        self.loadListRequest();
    }
    
    func downPlullLoadData(){
        self.loadMoreListRequest();
    }
    
    
    override func loadAllFinish(){
        
        if self.tableView.headerView?.isRefreshing == true {
            //停止刷新
            self.tableView.headerView?.endRefreshing()
            //重置footer的状态
            self.tableView.footerView!.resetNoMoreData();
        }
        
        if (self.tableView.footerView?.isRefreshing == true) {
            //停止刷新
            self.tableView.footerView?.endRefreshing()
            if self.dataArray?.count < self.pageNum * self.pageSize + 1 {
                self.tableView.footerView!.noticeNoMoreData();
            }
        }
    }
}
