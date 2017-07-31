//
//  Animator.swift
//  UIViewTransitionDemo
//
//  Created by lixiangzhou on 2017/7/31.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

enum AnimatorType {
    case push, present
}

enum AnimatorStyle {
    case forward    // push present
    case backward   // pop dismiss
}

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    private var type: AnimatorType
    var style = AnimatorStyle.forward
    init(type: AnimatorType) {
        self.type = type
        super.init()
    }
    
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
        
        switch style {
        case .forward:
            UIView.transition(from: fromVC.view, to: toVC.view, duration: transitionDuration(using: transitionContext), options: UIViewAnimationOptions.transitionCrossDissolve, completion: { _ in transitionContext.completeTransition(true) })
        case .backward:
            UIView.transition(from: fromVC.view, to: toVC.view, duration: transitionDuration(using: transitionContext), options: UIViewAnimationOptions.transitionCrossDissolve, completion: { _ in transitionContext.completeTransition(true) })
        }
        

    }
}
