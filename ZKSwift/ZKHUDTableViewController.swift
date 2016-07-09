//
//  ZKHUDTableViewController.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/9.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit
import SJProgressHUD

class ZKHUDTableViewController: ZKRefreshTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    func showWaiting(text : String, autoRemove : Bool? = false){
        SJProgressHUD.showWaiting(text, autoRemove: autoRemove!);
    }
    
    
    func showSuccess(text : String, autoRemove : Bool? = true){
        SJProgressHUD.showSuccess(text, autoRemove: autoRemove!);
    }
    
    func showError(text : String, autoRemove : Bool? = true){
        SJProgressHUD.showError(text, autoRemove: autoRemove!);
    }
    
    func showInfo(text : String, autoRemove : Bool? = true){
        SJProgressHUD.showInfo(text, autoRemove: autoRemove!);
    }
    
    func showText(text : String, autoRemove : Bool? = true){
        SJProgressHUD.showOnlyText(text, autoRemove: autoRemove!);
    }
    
    func dismissShow(){
        SJProgressHUD.dismiss()
    }
    
    override func loadRequestFail() {
        super.loadRequestFail();
        showError("网络错误");
    }

}
