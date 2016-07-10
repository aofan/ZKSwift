//
//  ZKHUDTableViewController.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/9.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit
import XLProgressHUD

class ZKHUDTableViewController: ZKRefreshTableViewController {
    
    let center = "center"
    let top    = "top"
    let bottom = "bottom"
    
    lazy var window : UIWindow? = {
        return (UIApplication.sharedApplication().delegate?.window)!;
    }();
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    func showWaiting(text : String, position : String = "center"){
        window?.showLoadingTilteActivity(text, position: position)
    }
    
    func hideWaiting(){
        window?.hideActivity();
    }
    
    
    func showSuccess(text : String, position : String = "center", interval : CGFloat = 1.0){
        window?.showMessageAndImage(text, image: UIImage(named: "hudSuccess"), interval: interval, position: position)
    }
    
    func showError(text : String, position : String = "center", interval : CGFloat = 1.0){
        window?.showMessageAndImage(text, image: UIImage(named: "hudError"), interval: interval, position: position)
    }
    
    func showText(text : String, position : String = "center", interval : CGFloat = 1.0){
        window?.showMessage(text, interval: interval, position: position);
    }
    
    override func loadRequestFail() {
        
        //延迟1秒 模拟加载时间 这里上拉刷新有个bug  说一要延迟1秒
        let time: NSTimeInterval = 1.0
        let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC)))
        dispatch_after(delay, dispatch_get_main_queue(), {
            
            super.loadRequestFail();
            
            if self.isHaveData == true {
                self.showError("网络加载失败")
            }
        });
    }

}

