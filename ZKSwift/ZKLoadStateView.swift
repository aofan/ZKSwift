//
//  LoadStateView.swift
//  ZKSwift
//
//  Created by lizhikai on 16/7/7.
//  Copyright © 2016年 ZK. All rights reserved.
//

import UIKit

class ZKLoadStateView: ZKBaseView {
    
    typealias touchesHandler = ()->Void;
    
    var touchesHandlerFunc : touchesHandler?;
    
    
    var loadState : LoadState?{
        
        didSet{
            self.removeAllSubviews();
            if self.loadState == LoadState.LoadStateLoading {
                self.createLoadingView();
            }
            
            if self.loadState == LoadState.LoadStateNoneData {
                self.createNoneData();
            }
            
            if self.loadState == LoadState.LoadStateNetworkError {
                self.createNetworkError();
            }
        }
    }
    
    /**
     正在加载中的视图
     */
    func createLoadingView(){
        
        let activyView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray);
        let activyViewPoint = CGPointMake(self.getMiddlePoint().x, self.getMiddlePoint().y - 40)
        activyView.center = activyViewPoint;
        
        let label = UILabel(frame: CGRect(origin:CGPoint(x: self.getMiddlePoint().x - 50, y: self.getMiddlePoint().y - 30), size: CGSize(width: 100, height: 30)));
        label.text = "加载中...";
        label.font = UIFont.systemFontOfSize(15);
        label.textAlignment = NSTextAlignment.Center;
        label.textColor = UIColor.lightGrayColor();
    
        self.addSubview(activyView);
        self.addSubview(label);
        activyView.startAnimating();
    }
    
    /**
     没有数据的时候的视图
     */
    func createNoneData() {
        
        self.createView("HaveNoneData", text: "暂无数据");
    }
    
    /**
     网络错误的时候的视图
     */
    func createNetworkError() {
        self.createView("HaveNoNet", text: "网络连接异常，请点击屏幕重试");
    }
    
    /**
     创建视图
     
     - parameter imageName: 图片名称
     - parameter text:      内容
     */
    func createView( imageName : String, text : String){
        
        let imageViewWith:CGFloat = 150;
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: self.getMiddlePoint().x - imageViewWith/2, y: self.getMiddlePoint().y - imageViewWith), size: CGSize(width: imageViewWith, height: imageViewWith)));
        imageView.image = UIImage(named: imageName);
        
        let label = UILabel(frame: CGRect(origin:CGPoint(x: self.getMiddlePoint().x - 140, y: self.getMiddlePoint().y), size: CGSize(width: 280, height: 30)));
        
        label.text = text;
        label.font = UIFont.systemFontOfSize(15);
        label.textAlignment = NSTextAlignment.Center;
        label.textColor = UIColor.lightGrayColor();
        
        self.addSubview(imageView);
        self.addSubview(label);

        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if self.loadState == LoadState.LoadStateNetworkError {
            self.touchesHandlerFunc?();
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame);
        self.backgroundColor = UIColor.clearColor();
    }
}



public enum LoadState : Int {
    
    case LoadStateLoading
    
    case LoadStateNetworkError
    
    case LoadStateNoneData
    
}
