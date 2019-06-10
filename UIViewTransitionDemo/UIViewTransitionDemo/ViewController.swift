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
//        navigationController?.pushViewController(ToViewController(), animated: true)
        let toVC = ToViewController()
        toVC.transitioningDelegate = animator
        toVC.modalPresentationStyle = .custom
        toVC.view.backgroundColor = .init(white: 1, alpha: 0.5)
        present(toVC, animated: true, completion: nil)
    }

}

