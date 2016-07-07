//
//  ZKBaseView.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/7.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit

class ZKBaseView: UIView {

    /**
     移除所有的子组件
     */
    func removeAllSubviews(){
        for view in self.subviews {
            view.removeFromSuperview();
        }
    }
    
    /**
     获取View的中心点
     
     - returns: 中心点
     */
    func getMiddlePoint() -> CGPoint {
        return CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
    }

}
