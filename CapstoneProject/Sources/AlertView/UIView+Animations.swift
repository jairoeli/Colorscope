//
//  UIView+Animations.swift
//  CapstoneProject
//
//  Created by Jairo Eli de Leon on 11/2/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

/*!
 The intended direction of the animation
 - in:  Animate in
 - out: Animate out
 */
internal enum AnimationDirection {
    case `in`
    case out
}

internal extension UIView {

    /// The key for the fade animation
    internal var fadeKey: String { return "FadeAnimation" }

    /*!
     Applies a fade animation to this view
     - parameter direction: Animation direction
     - parameter value:     The end value of this animation
     - parameter duration:  The duration of this animation
     */
    internal func pv_fade(_ direction: AnimationDirection, _ value: Float, duration: CFTimeInterval = 0.08) {
        layer.removeAnimation(forKey: fadeKey)
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.duration = duration
        animation.fromValue = layer.presentation()?.opacity
        layer.opacity = value
        animation.fillMode = kCAFillModeForwards
        layer.add(animation, forKey: fadeKey)
    }

    internal func pv_layoutIfNeededAnimated(duration: CFTimeInterval = 0.08) {
        UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions(), animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
}
