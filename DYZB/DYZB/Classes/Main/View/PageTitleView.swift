//
//  PageTitleView.swift
//  DYZB
//
//  Created by 北京时代华擎 on 17/5/1.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

import UIKit
private let scrollLineH :CGFloat=2

class PageTitleView: UIView {
    
//定义属性
    private var titles :[String]
    
    
//懒加载属性
    private lazy var scrollView:UIScrollView={
        
      let scrollView=UIScrollView()
        scrollView.showsHorizontalScrollIndicator=false
        scrollView.scrollsToTop=false
        scrollView.bounces=false
        return scrollView
        
        
    
    }()
    
    private lazy var titleLables : [UILabel] = [UILabel]()
    
    private lazy var scrollerLine:UIView = {
    
    let scrollerLine=UIView()
    scrollerLine.backgroundColor=UIColor.orangeColor()
    return scrollerLine
        
    }()
    
//自定义构造函数
    init(frame: CGRect,titles:[String]) {
        
        self.titles=titles
        super.init(frame:frame)
        
        setupUI()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension PageTitleView{
    
    private func setupUI(){
// 1、添加UISCollerView
        addSubview(scrollView)
        scrollView.frame=bounds
//2、添加title对应的Lable
        setupTitleLables()
        
//3、设置底线和滚动滑块
        
     setupBottonLineAndScollLine()
    }
    
    private func setupBottonLineAndScollLine(){
        
        let botton=UIView()
        botton.backgroundColor=UIColor.redColor()
        let lineH:CGFloat = 0.5
        botton.frame=CGRect(x: 0, y: frame.height-lineH, width: frame.width, height: lineH)
//        scrollView.addSubview(botton)
        addSubview(botton)
        
        
//1、获取第一个label
      guard  let firstLabel = titleLables.first else {return}
      firstLabel.textColor = UIColor.orangeColor()
        
//2、设置scrollerLine的属性
        scrollView.addSubview(scrollerLine)
        scrollerLine.frame=CGRect(x: firstLabel.frame.origin.x, y: frame.height - scrollLineH, width: firstLabel.frame.width, height: scrollLineH)
    
    
    }
    
    private func setupTitleLables(){
    
        for (index,title) in titles.enumerate(){
        
        
//1、创建UILable
            let lable=UILabel()
            lable.text=title
            lable.tag=index
            lable.textAlignment = .Center
            lable.textColor=UIColor.darkGrayColor()
            lable.font=UIFont.systemFontOfSize(16.0)
            
            let lableW:CGFloat=frame.width / CGFloat(titles.count)
            let lableH:CGFloat=frame.height - scrollLineH
            let lableX:CGFloat=lableW * CGFloat(index)
            let lableY:CGFloat=0
            lable.frame=CGRect(x: lableX, y: lableY, width: lableW, height: lableH)
            
//2、将uilable添加到scrollerview中
            scrollView.addSubview(lable)
            titleLables.append(lable)
            
            
        }
  }
    
    

}
