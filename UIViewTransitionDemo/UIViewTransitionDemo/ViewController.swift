//
//  ViewController.swift
//  UIViewTransitionDemo
//
//  Created by lixiangzhou on 2017/7/31.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let animator = Animator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let toVC = ToViewController()
        toVC.transitioningDelegate = animator
        toVC.modalPresentationStyle = .custom
        present(toVC, animated: true, completion: nil)
    }

}

