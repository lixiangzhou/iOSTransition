//
//  ViewController.swift
//  UIViewControllerTransitionDemo
//
//  Created by lixiangzhou on 2017/7/31.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        view.addSubview(UIButton(type: .contactAdd))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        transitionFrom(fromVC: self, toVC: parentVC?.toVC)
//        transitionFrom(fromVC: self, toVC: self)
    }


}

