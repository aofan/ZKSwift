//
//  ZKBaseTableViewController.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/4.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit

public class ZKBaseTableViewController: UITableViewController {
    
    /// 数据处理
    var baseDataHandler : ZKAlamofireHandler?;
    /// 数据源
    public var dataArray : Array<AnyObject>?;
    /// 是否分组
    public var isGroup:Bool = false;
    /// 默认每页10条数据
    public var pageSize = 10;
    /// 开始页 默认第一页开始的
    public var startPageNum = 1;
    /// 当前页页码
    public var pageNum = 1;
    /// 是否第一次进行网络请求
    public var isFirstRequest = true;
    /// 是否有数据
    public var isHaveData : Bool!{
        get{
            if self.dataArray?.count > 0 {
                return true;
            }
            return false;
        }
    }
    
    
    /**
     请求数据  要求子类实现
     */
    public func loadListRequest(){}
    /**
     请求更多数据  要求子类实现
     */
    public func loadMoreListRequest(){}
    /**
     全部加载完成
     */
    public func loadAllFinish(){}
    /**
     请求成功
     */
    public func loadRequestSuccess(){}
    /**
     请求失败
     */
    public func loadRequestFail(){}

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.pageNum = self.startPageNum;
    }
    
    
    
// MARK: - tableView数据展示的处理
    
    override public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //分组
        if isGroup {
            //有数据
            if (self.dataArray != nil) {
                return (self.dataArray?.count)!;
            }
            //无数据
            return 0;
        }
        
        //不分组
        return 1;
    }
    
    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //分组
        if isGroup {
            //有数据
            if (self.dataArray != nil) {
                return self.dataArray![section].count
            }
            //没数据
            return 0;
        }else{//不分组
            
            //没数据
            if ((self.dataArray?.count) == nil) {
                return 0;
            }
            //有数据
            return (self.dataArray?.count)!;
            
        }
        
    }
    
    
    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let baseModel : ZKBaseModel? = self.indexPathForSource(indexPath);
        
        return self.indexPathWithSourceForCell(indexPath, baseModel: baseModel);
        
    }
    
    /**
     根据数据模型和索引创建对应的cell
     
     - parameter indexPath: 索引
     - parameter baseModel: 数据模型
     
     - returns: cell
     */
    private func indexPathWithSourceForCell( indexPath : NSIndexPath, baseModel : ZKBaseModel?) -> ZKBaseTableViewCell{
        
        var cell : ZKBaseTableViewCell?;
        let reuseIdentifier = String(baseModel!.cellClass!);
        
        //是否加载xib 处理展示的cell
        if baseModel?.isloadNib == true {
            
            let nib = UINib.init( nibName: reuseIdentifier, bundle:NSBundle.mainBundle());
            
            tableView.registerNib( nib, forCellReuseIdentifier: reuseIdentifier );
            
            cell = tableView.dequeueReusableCellWithIdentifier( reuseIdentifier, forIndexPath: indexPath ) as? ZKBaseTableViewCell;
            
        }else{
            
            let type = baseModel!.cellClass as! ZKBaseTableViewCell.Type;
            
            //对于Cell复用的处理
            cell = tableView.dequeueReusableCellWithIdentifier( reuseIdentifier ) as? ZKBaseTableViewCell;
            if cell == nil {
                cell = type.init( style:UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier );
            }
        }
        
        cell!.source = baseModel;
        cell!.indexPath = indexPath;
        cell?.cellEventHandler = cellEventHandler;
        return cell!;
    }
    
    
    
// MARK: - cell的点击事件处理
    
    override public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.didSelectCell(self.indexPathForSource(indexPath));
        
    }
    
    /**
     cell 的整体点击事件  子类要想响应点击事件必须掉用此方法
     
     - parameter source: 数据模型
     */
    public func didSelectCell( source : ZKBaseModel ) {
        self.cellEventHandler(source);
    }
    /**
     cell 的事件处理  子类用到时候需要重写
     
     - parameter source:    数据模型
     - parameter cell:      发生事件的cell
     - parameter target:    区分同一个cell上的不同事件的标志
     - parameter indexPath: 索引
     */
    public func cellEventHandler( source : ZKBaseModel, cell : ZKBaseTableViewCell? = nil, target : AnyObject? = nil, indexPath : NSIndexPath? = nil ){
        
    }
    
    
    
// MARK: - 根据cell获取数据模型
    
    /**
     获取cell对应的模型
     
     - parameter indexPath: 索引
     
     - returns: 数据模型
     */
    private func indexPathForSource( indexPath : NSIndexPath) -> ZKBaseModel{
        
        var baseModel : ZKBaseModel?;
        //是否分组来处理数据源
        if self.isGroup {
            baseModel = self.dataArray![indexPath.section][indexPath.row] as? ZKBaseModel;
        }else{
            baseModel = self.dataArray![indexPath.row] as? ZKBaseModel;
        }
        
        return baseModel!;
    }
    
}
