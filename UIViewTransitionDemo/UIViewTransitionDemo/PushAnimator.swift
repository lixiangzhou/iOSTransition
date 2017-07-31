//
//  PushAnimator.swift
//  UIViewTransitionDemo
//
//  Created by lixiangzhou on 2017/7/31.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit



class PushAnimator: NSObject {
    fileprivate let animator = Animator(type: .push)
}

extension PushAnimator: UINavigationControllerDelegate {
    @objc(navigationController:animationControllerForOperation:fromViewController:toViewController:) func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator.style = (operation == .push) ? .forward : .backward
        return animator
    }
}
