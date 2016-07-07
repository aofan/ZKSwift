//
//  ZKRequestTableViewController.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/7.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit

class ZKRequestTableViewController: ZKBaseTableViewController {
    
    /// 是否正在加载数据
    var isLoading = false{
        didSet{
            if isLoading == true {
                self.setloadState(LoadState.LoadStateLoading);
            }else{
                self.loadStateView.removeFromSuperview();
            }
        }
    }
    
    /// 网络请求状态视图
    private var _loadStateView : ZKLoadStateView?
    var loadStateView : ZKLoadStateView!{
        get{
            if _loadStateView == nil {
                _loadStateView = ZKLoadStateView(frame: self.view.bounds);
            }
            return _loadStateView;
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /**
     所有的数据都加载完了
     */
    func loadAllFinish(){
        
        self.isLoading = false;
        if self.baseDataHandler?.requestResult == AlamofireRequestResult.AlamofireRequestSuccess {
            
            self.dataArray = self.baseDataHandler?.dataArray;
            
            self.tableView.reloadData();
            
            if self.dataArray == nil || self.dataArray?.count == 0 {
                self.setloadState(LoadState.LoadStateNoneData);
            }
            
        }else{
            self.loadRequestFail();
        }
    }
    
    
    func loadRequestFail(){
        if (self.dataArray == nil || self.dataArray?.count == 0) {
            self.setloadState(LoadState.LoadStateNetworkError);
        }else{
        }
    }
    
    /**
     没网的时候触摸加载数据
     */
    func touchesHandlerFunc(){
        self.loadListRequest();
    }
    
    /**
     设置数据加载显示状态
     
     - parameter loadState: 状态
     */
    func setloadState( loadState : LoadState){
        self.loadStateView.removeFromSuperview();
        self.loadStateView.loadState = loadState;
        self.loadStateView.touchesHandlerFunc = touchesHandlerFunc;
        self.view.addSubview(self.loadStateView!);
    }
}
