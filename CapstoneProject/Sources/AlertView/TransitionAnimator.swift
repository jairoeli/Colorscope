//
//  PopupDialogTransitionAnimator.swift
//  CapstoneProject
//
//  Created by Jairo Eli de Leon on 11/2/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

/// Base class for custom transition animations
internal class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    var to: UIViewController!
    var from: UIViewController!
    let inDuration: TimeInterval
    let outDuration: TimeInterval
    let direction: AnimationDirection

    init(inDuration: TimeInterval, outDuration: TimeInterval, direction: AnimationDirection) {
        self.inDuration = inDuration
        self.outDuration = outDuration
        self.direction = direction
        super.init()
    }

    internal func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return direction == .in ? inDuration : outDuration
    }

    internal func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        switch direction {
        case .in:
            to = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
            from = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
            let container = transitionContext.containerView
            container.addSubview(to.view)
        case .out:
            to = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
            from = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        }
    }
}
