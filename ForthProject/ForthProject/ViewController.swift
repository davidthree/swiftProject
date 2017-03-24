//
//  ViewController.swift
//  ForthProject
//
//  Created by David on 2017/3/23.
//  Copyright © 2017年 David. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var listArray = [String]()
        for i in 1...6 {
            let imgString = String(format:"videoScreenshot0%d",i)
            listArray.append(imgString)
        }
        let bannerView = DVBannerView.init(photoArray:listArray)
        
        
        self.view.addSubview(bannerView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

