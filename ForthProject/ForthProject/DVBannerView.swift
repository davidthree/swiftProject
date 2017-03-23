//
//  DVBannerView.swift
//  ForthProject
//
//  Created by David on 2017/3/23.
//  Copyright © 2017年 David. All rights reserved.
//

import UIKit

class DVBannerView: UIView {
    public let MainBounds:CGRect = UIScreen.main.bounds
    public let ImageHeight:CGFloat = UIScreen.main.bounds.width * 220/375
    public let ImageWidth:CGFloat = UIScreen.main.bounds.width
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let bannerView = UIScrollView()
    func createBanner(imageArray:[String])
    {
        assert(imageArray.count > 0 , "Invalid Array Size")
        
        self.createBannerView()
    }
    
    func createBannerView()
    {
        self.frame = CGRect.init(x: 0, y: 0, width: MainBounds.width, height: ImageHeight)
        self.backgroundColor = UIColor.red
        
        self.addSubview(bannerView)
        
        bannerView.snp.makeConstraints { (make) -> Void in
            make.left.equalToSuperview().offset(0)
            make.top.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.height.equalTo(ImageHeight)
        }
        bannerView.contentSize = CGSize.init(width: ImageWidth*6, height: ImageHeight)
        bannerView.isPagingEnabled = true
        bannerView.backgroundColor = UIColor.green

        
        for i in 0...5
        {
            let a = Int(ImageWidth)
            let imageView = UIImageView()
            imageView.backgroundColor = UIColor.purple
            bannerView.addSubview(imageView)
            imageView.image = UIImage.init(named: String(format:"videoScreenshot0%d",i+1))
            imageView.snp.makeConstraints({ (make)->Void in
                make.left.equalToSuperview().offset(a*i)
                make.top.equalToSuperview().offset(0)
                make.width.equalTo(ImageWidth)
                make.height.equalTo(ImageHeight)
            })
        }
        
    }

}
