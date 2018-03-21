//
//  RecommendCycle.swift
//  DYZB
//
//  Created by 李孔文 on 2018/3/6.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//


//注意
//去掉xib的autolayout和autosizing不要他随父控件的拉伸而拉伸
import UIKit
private let cycleId = "cycleCell"

class RecommendCycle: UIView {
    
    //定义定时器
    var cycleTimer : Timer?
    //数据
    var data : [GuideModel]?{
        didSet{
            guard data != nil else{return}
            pageController.numberOfPages = (data?.count)!
            collectionView.reloadData()
        }
    }
    //控件属性
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        //不随父控件的拉伸而拉伸
        self.autoresizingMask = UIViewAutoresizing(rawValue: 0)
        //普通注册
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cycleId)
        
        collectionView.register(UINib(nibName: "cycleCell", bundle: nil), forCellWithReuseIdentifier: cycleId)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        
        //设置页控件点击事件
        pageController.addTarget(self, action: #selector(pageChanged(_:)),
                              for: .valueChanged)
        
        removeCycleTime()
        addCycleTime()
    }
    
    //设置collection的样式
    override func layoutSubviews() {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize=(self.bounds.size)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
    }
    
    

}

extension RecommendCycle{
    //提供一个快速创建View的类方法
  class func createCycleView() -> RecommendCycle {
        return Bundle.main.loadNibNamed("RecommendCycle", owner: nil, options: nil)?.first as! RecommendCycle
    }
}

//遵守数据源方法
extension RecommendCycle : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (data?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cycleId, for: indexPath) as! cycleCell
        cell.model = data![indexPath.row] 
        return cell
    }
}

//监听滚动，设置page
extension RecommendCycle : UICollectionViewDelegate ,UIPageViewControllerDelegate{
    
    //滚动开始
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        //开始滚动的时候移除定时器
        removeCycleTime()

    }
    
    
    //滚动中
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let currentPage = floor((scrollView.contentOffset.x - screenW / 2) / screenW) + 1
        print("currentPage===\(currentPage)")

        pageController.currentPage = Int(currentPage)
        if Int(currentPage) >= (data?.count)!{
            print("要超出最大")
                        pageController.currentPage = 0
                        collectionView.setContentOffset(CGPoint(x:0 ,y:0), animated: false)
        }
        
        if Int(currentPage) <= -1{
            print("要超出最小")
        }
        
//        //当滚动到最后
//        if Int(currentPage) == pageController.numberOfPages{
//
//            pageController.currentPage = 0
//            collectionView.setContentOffset(CGPoint(x:0 ,y:0), animated: true)
//        }
//        //当滚动到第一个
//        if currentPage == 0 {
//
//            pageController.currentPage = pageController.numberOfPages - 1
//            let offset = screenW * CGFloat((pageController.numberOfPages - 1))
//            collectionView.setContentOffset(CGPoint(x:offset ,y:0), animated: true)
//        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
      
        //滚动结束后开启定时器
        addCycleTime()
    }
    
    //点击页控件时事件处理(hava a bug)
    @objc func pageChanged(_ sender:UIPageControl) {
        //根据点击的页数，计算scrollView需要显示的偏移量
        var frame = collectionView.frame
        frame.origin.x = frame.size.width * CGFloat(sender.currentPage)
        frame.origin.y = 0
        //展现当前页面内容
        collectionView.scrollRectToVisible(frame, animated:true)
    }
}

//创建定时器得操作方法
extension RecommendCycle{
    //创建定时器
    func addCycleTime()  {
        
        guard cycleTimer == nil else {
            return
        }
        cycleTimer = Timer.scheduledTimer(timeInterval: 3.0, target:self, selector:#selector(self.scrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTimer!, forMode:.commonModes)

    }
    
    //移除定时器
    func removeCycleTime()  {
        //从运行循环中移除
        cycleTimer?.invalidate()
        cycleTimer = nil
        
    }
    
    //滚动到下一个
    @objc func scrollToNext() {
        
        let currentOffset = collectionView.contentOffset.x
        let offSet = currentOffset + collectionView.bounds.width
        collectionView.setContentOffset(CGPoint(x:offSet ,y:0), animated: true)
        
        
        
    }
}

