//
//  PresentAnimator.swift
//  UIViewTransitionDemo
//
//  Created by lixiangzhou on 2017/7/31.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

class PresentAnimator: NSObject {
    fileprivate let animator = Animator(type: .present)
}

extension PresentAnimator: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator.style = .forward
        return animator
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator.style = .backward
        return animator
    }
}
