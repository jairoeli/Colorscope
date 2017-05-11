//
//  PopupDialogPresentationController.swift
//  CapstoneProject
//
//  Created by Jairo Eli de Leon on 11/2/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

final internal class PresentationController: UIPresentationController {

    fileprivate lazy var overlay: PopupDialogOverlayView = {
        return PopupDialogOverlayView(frame: .zero)
    }()

    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        overlay.blurView.underlyingView = presentingViewController?.view
        overlay.frame = (presentingViewController?.view.bounds)!
    }

    override func presentationTransitionWillBegin() {
        overlay.frame = containerView!.bounds
        containerView!.insertSubview(overlay, at: 0)

        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (_) -> Void in
            self.overlay.alpha = 1.0
        }, completion: nil)
    }

    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (_) -> Void in
            self.overlay.alpha = 0.0
        }, completion: nil)
    }

    override func containerViewWillLayoutSubviews() {
        presentedView!.frame = frameOfPresentedViewInContainerView
        overlay.blurView.setNeedsDisplay()
    }

}
