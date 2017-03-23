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
        let bannerView = DVBannerView()
        bannerView.createBannerView()
        self.view.addSubview(bannerView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

