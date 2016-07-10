//
//  ZKRootTableViewController.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/10.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit

class ZKRootTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        let btn = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 40));
        btn.setTitle("按钮", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        btn.addTarget(self, action: #selector(ZKRootTableViewController.pushVc), forControlEvents: UIControlEvents.TouchDown);
        self.view.addSubview(btn);
        
    }
    
    func pushVc(){
        let vc = ZKTableViewController();
        self.navigationController?.pushViewController(vc, animated: true);
        
    }

}
