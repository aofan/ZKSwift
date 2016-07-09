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
    
    private var _refreshHeaderView : XWRefreshNormalHeader?;
    var refreshHeaderView : XWRefreshNormalHeader?{
        get{
            if _refreshHeaderView == nil {
                _refreshHeaderView = XWRefreshNormalHeader(target: self, action: #selector(ZKRefreshTableViewController.upPullLoadData));
            }
            return _refreshHeaderView;
        }
    }
    
    
    private var _refreshFooterView : XWRefreshAutoNormalFooter?;
    var refreshFooterView : XWRefreshAutoNormalFooter?{
        if _refreshFooterView == nil {
            _refreshFooterView = XWRefreshAutoNormalFooter(target: self, action: #selector(ZKRefreshTableViewController.downPlullLoadData));
        }
        return _refreshFooterView;
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.headerView = refreshHeaderView;
        self.tableView.footerView = refreshFooterView;
    }
    
    
    func upPullLoadData(){
        self.loadListRequest();
    }
    
    func downPlullLoadData(){
        print("================================================================================================")
        self.loadMoreListRequest();
    }
    
    override func loadListRequest() {
        super.loadListRequest();
        self.isFirstRequest = true;
        self.pageNum = self.startPageNum;
    }
    
    override func loadMoreListRequest() {
        super.loadMoreListRequest();
        self.isFirstRequest = false;
    }
    
    override func loadAllFinish(){
        super.loadAllFinish()
    }
    
    override func loadRequestSuccess() {
        super.loadRequestSuccess()
        setTableHFViewState();
        if self.dataArray?.count < self.pageNum * self.pageSize {
            //设置foot没有更多数据了
            refreshFooterView?.noticeNoMoreData();
        }else{
            //重置footer的状态
            refreshFooterView?.resetNoMoreData();
        }
        
        self.pageNum += 1;

    }
    
    override func loadRequestFail(){
        super.loadRequestFail();
        setTableHFViewState();
    }
    
    
    /**
    设置tableView头部和尾部状态
    **/
    func setTableHFViewState(){
        if refreshHeaderView?.isRefreshing == true {
            //停止刷新
            refreshHeaderView?.endRefreshing()
        }
        
        if (refreshFooterView?.isRefreshing == true) {
            //停止刷新
            refreshFooterView?.endRefreshing()
        }
    }
}
