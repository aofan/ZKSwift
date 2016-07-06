//
//  ZKBaseTableViewController.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/4.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit

class ZKBaseTableViewController: UITableViewController {
    
    /// 数据处理
    var baseDataHandler : ZKAlamofireHandler?;
    /// 数据源
    var dataArray : Array<AnyObject>?;
    /// 是否分组
    var isGroup:Bool = false;
    
    
    
    /**
     请求数据  要求子类实现
     */
    func loadListRequest(){}

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
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
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
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
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var baseModel : ZKBaseModel?;
        var cell : ZKBaseTableViewCell?;
        
        //是否分组来处理数据源
        if self.isGroup {
            baseModel = self.dataArray![indexPath.section][indexPath.row] as? ZKBaseModel;
        }else{
            baseModel = self.dataArray![indexPath.row] as? ZKBaseModel;
        }
        
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
        
        return cell!;
        
    }
}
