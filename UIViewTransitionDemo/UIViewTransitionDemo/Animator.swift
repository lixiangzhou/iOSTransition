//
//  Animator.swift
//  UIViewTransitionDemo
//
//  Created by lixiangzhou on 2017/7/31.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

class Animator: NSObject {
    var isPresent: Bool!
}

extension Animator: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        return self
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        return self
    }
}

extension Animator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        /*
         左右翻转动画
         public static var transitionFlipFromLeft: UIViewAnimationOptions { get }
         public static var transitionFlipFromRight: UIViewAnimationOptions { get }
         
         翻页动画
         public static var transitionCurlUp: UIViewAnimationOptions { get }
         public static var transitionCurlDown: UIViewAnimationOptions { get }
         
         渐变动画
         public static var transitionCrossDissolve: UIViewAnimationOptions { get }
         
         上下翻转动画
         public static var transitionFlipFromTop: UIViewAnimationOptions { get }
         public static var transitionFlipFromBottom: UIViewAnimationOptions { get }
         */
        
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to) else {
                transitionContext.completeTransition(true)
                return
        }
        
        if isPresent == true {
            UIView.transition(from: fromVC.view, to: toVC.view, duration: transitionDuration(using: transitionContext), options: UIViewAnimationOptions.transitionCrossDissolve, completion: { _ in transitionContext.completeTransition(true) })
        } else {
            UIView.transition(from: fromVC.view, to: toVC.view, duration: transitionDuration(using: transitionContext), options: UIViewAnimationOptions.transitionCrossDissolve, completion: { _ in transitionContext.completeTransition(true) })
        }
    }
}
