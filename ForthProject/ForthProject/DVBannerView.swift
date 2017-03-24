//
//  DVBannerView.swift
//  ForthProject
//
//  Created by David on 2017/3/23.
//  Copyright © 2017年 David. All rights reserved.
//

import UIKit

class DVBannerView: UIView ,UIScrollViewDelegate{
    
    public let MainBounds:CGRect = UIScreen.main.bounds

    private let ImageHeight:CGFloat = UIScreen.main.bounds.width * 220/375
    private let ImageWidth:CGFloat = UIScreen.main.bounds.width
    private let ShadowHeight:CGFloat = 40.0
    private let WidthEdge:CFloat = 10.0
    private let HeightEdge:CFloat = 5.0

    
    internal var photoList:Array = [String]()
    internal var timer: Timer?
    
    public convenience init(photoArray:[String])
    {
        assert(photoArray.count > 0 , "Invalid Array")
        self.init()
        photoList = photoArray
        
        self.frame = CGRect.init(x: 0, y: 0, width: MainBounds.width, height: ImageHeight)
        self.backgroundColor = UIColor.clear
        
        self.createBannerView(array: photoArray)
        self.createImageList(array: photoArray)
        self.startTimer()
    }
    
    lazy var bannerView: UIScrollView =
        {
            let scrollView = UIScrollView()
            scrollView.isPagingEnabled = true
            scrollView.delegate = self
            scrollView.decelerationRate = 1
            scrollView.setContentOffset(CGPoint.init(x: UIScreen.main.bounds.width, y: 0), animated: false)
            return scrollView
    }()
    
    lazy var shadowView: UIView =
        {
            let view = UIView.init()
            view.backgroundColor = UIColor.black
            view.alpha = 0.5
            return view
    }()
    
    lazy var titleLabel: UILabel =
        {
            let label = UILabel.init()
            label.textColor = UIColor.white
            label.font = UIFont.systemFont(ofSize: 15)
            label.text = "这是一个测试Label"
            return label
    }()
    
    lazy var pageControlView: UIPageControl =
        {
            let pageControl = UIPageControl()
            pageControl.currentPageIndicatorTintColor = UIColor.white
            return pageControl
    }()
    private func startTimer()
    {
        self.timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(DVBannerView.autoSlide), userInfo: nil, repeats: true)
    }
    
    
    @objc private func autoSlide()
    {
//        let index = bannerView.contentOffset.x / MainBounds.width
        bannerView.setContentOffset(CGPoint.init(x: bannerView.contentOffset.x+MainBounds.width, y: 0), animated: true)
    }
    
    private func createBannerView(array:[String])
    {
        if array.count==1
        {
            bannerView.contentSize = CGSize.init(width: ImageWidth*CGFloat(array.count), height: ImageHeight)
        }else
        {
            bannerView.contentSize = CGSize.init(width: ImageWidth*(CGFloat(array.count)+2), height: ImageHeight)
        }
        
        self.addSubview(bannerView)
        bannerView.snp.makeConstraints { (make) -> Void in
            make.left.equalToSuperview().offset(0)
            make.top.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.height.equalTo(ImageHeight)
        }
        
        self.addSubview(shadowView)
        shadowView.snp.makeConstraints { (make) -> Void in
            make.left.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.height.equalTo(ShadowHeight)
        }
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(shadowView).offset(WidthEdge)
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(20)
        }
        
        pageControlView.numberOfPages = array.count
        self.addSubview(pageControlView)
        pageControlView.snp.makeConstraints { (make) -> Void in
            make.right.equalToSuperview().offset(-WidthEdge)
            make.bottom.equalToSuperview().offset(-HeightEdge)
    
            make.height.equalTo(20)
        }
        
        
    }
    private func createImageList(array:[String])
    {
        
        if array.count == 1
        {
            let imageView = UIImageView()
            bannerView.addSubview(imageView)
            imageView.image = UIImage.init(named: array[0])
            imageView.snp.makeConstraints({ (make)->Void in
                make.left.equalToSuperview().offset(0)
                make.top.equalToSuperview().offset(0)
                make.width.equalTo(ImageWidth)
                make.height.equalTo(ImageHeight)
            })
        }else
        {
            for i in 0...array.count+1
            {
                let imageView = UIImageView()
                bannerView.addSubview(imageView)
                imageView.snp.makeConstraints({ (make)->Void in
                    make.left.equalToSuperview().offset(Int(ImageWidth)*i)
                    make.top.equalToSuperview().offset(0)
                    make.width.equalTo(ImageWidth)
                    make.height.equalTo(ImageHeight)
                })
                
                switch i {
                case 0:
                    imageView.image = UIImage.init(named: array.last!)
                case 1...array.count:
                    imageView.image = UIImage.init(named: array[i-1])
                case array.count+1 :
                    imageView.image = UIImage.init(named: array.first!)
                default:
                    break
                }
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){

        
        if scrollView.contentOffset.x > MainBounds.width*CGFloat(photoList.count+1) {
            scrollView.setContentOffset(CGPoint.init(x: MainBounds.width, y: 0), animated: false)

        }else if scrollView.contentOffset.x < 0 {
            scrollView.setContentOffset(CGPoint.init(x: MainBounds.width*CGFloat(photoList.count), y: 0), animated: false)
            pageControlView.currentPage = photoList.count-1
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / MainBounds.width)
        if index == photoList.count+1 {
            pageControlView.currentPage = 0
        }else if index == 0
        {
            pageControlView.currentPage = photoList.count-1
        }else
        {
            pageControlView.currentPage = index-1
        }
    }
    
}


