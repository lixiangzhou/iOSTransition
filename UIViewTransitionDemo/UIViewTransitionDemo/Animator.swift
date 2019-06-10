//
//  Animator.swift
//  UIViewTransitionDemo
//
//  Created by lixiangzhou on 2017/7/31.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

enum AnimatorStyle {
    case forward    // push present
    case backward   // pop dismiss
}

class Animator: NSObject {
    fileprivate var style = AnimatorStyle.forward
}

// MARK: - present代理 UIViewControllerTransitioningDelegate
extension Animator: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        style = .forward
        return self
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        style = .backward
        return self
    }
}

// MARK: - push代理 UINavigationControllerDelegate
extension Animator: UINavigationControllerDelegate {
    @objc(navigationController:animationControllerForOperation:fromViewController:toViewController:) func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        style = (operation == .push) ? .forward : .backward
        return self
    }
}

// MARK: - 执行动画 UIViewControllerAnimatedTransitioning
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
                transitionContext.completeTransition(false)
                return
        }
        
        switch style {
        case .forward:
            UIView.transition(from: fromVC.view, to: toVC.view, duration: transitionDuration(using: transitionContext), options: UIView.AnimationOptions.transitionCrossDissolve, completion: { _ in transitionContext.completeTransition(!transitionContext.transitionWasCancelled) })
        case .backward:
            UIView.transition(from: fromVC.view, to: toVC.view, duration: transitionDuration(using: transitionContext), options: UIView.AnimationOptions.transitionCrossDissolve, completion: { _ in transitionContext.completeTransition(!transitionContext.transitionWasCancelled) })
        }
    }
}
