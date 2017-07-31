//
//  ParentViewController.swift
//  UIViewControllerTransitionDemo
//
//  Created by lixiangzhou on 2017/7/31.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {

    let VC = ViewController()
    let toVC = ToViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        willMove(toParentViewController: self)
        addChildViewController(VC)
//        didMove(toParentViewController: self)
//        
//        willMove(toParentViewController: self)
        addChildViewController(toVC)
//        didMove(toParentViewController: self)
        
        view.addSubview(VC.view)
        VC.view.frame = view.bounds
        
        view.addSubview(toVC.view)
        toVC.view.frame = view.bounds
    }
}

extension UIViewController {
    func transitionFrom(fromVC: UIViewController?, toVC: UIViewController?) {
        // 判断是否为 nil
        guard let parentVC = self.parentVC, let fromVC = fromVC, let toVC = toVC else {
            return
        }
        
        // 判断是否相同
        if fromVC.isEqual(toVC) {
            return
        }
        
        // 判断是否都属于 parentVC 的子控制器
        if parentVC.childViewControllers.contains(fromVC) == false || parentVC.childViewControllers.contains(toVC) == false {
            return
        }
        
        /*
         public static var transitionFlipFromLeft: UIViewAnimationOptions { get }
         
         public static var transitionFlipFromRight: UIViewAnimationOptions { get }
         
         public static var transitionCurlUp: UIViewAnimationOptions { get }
         
         public static var transitionCurlDown: UIViewAnimationOptions { get }
         
         public static var transitionCrossDissolve: UIViewAnimationOptions { get }
         
         public static var transitionFlipFromTop: UIViewAnimationOptions { get }
         
         public static var transitionFlipFromBottom: UIViewAnimationOptions { get }
         */
        
        // 转场
        parentVC.transition(from: fromVC, to: toVC, duration: 0.5, options: UIViewAnimationOptions.transitionCurlUp, animations: {
            
        }) { (_) in
            
        }
    }
    
    var parentVC: ParentViewController? {
        guard let parentVC = parent as? ParentViewController else {
            return nil
        }
        return parentVC
    }
}
