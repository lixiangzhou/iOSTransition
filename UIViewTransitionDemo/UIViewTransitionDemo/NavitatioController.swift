//
//  NavitatioController.swift
//  UIViewTransitionDemo
//
//  Created by lixiangzhou on 2017/7/31.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

class NavitatioController: UINavigationController {

    let navDelegate = Animator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = navDelegate
    }

}
