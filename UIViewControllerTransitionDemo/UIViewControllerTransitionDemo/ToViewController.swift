//
//  ToViewController.swift
//  UIViewControllerTransitionDemo
//
//  Created by lixiangzhou on 2017/7/31.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

class ToViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        view.addSubview(UIButton(type: .infoLight))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        transitionFrom(fromVC: self, toVC: parentVC?.VC)
    }

}
