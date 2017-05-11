//
//  Dynamic Color
//  ColorHarmonies
//
//  Created by Jairo Eli de Leon on 10/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

// MARK: Deriving Colors

public extension DynamicColor {
  /**
   Creates and returns a color object with the hue rotated along the color wheel by the given amount.

   - parameter amount: A float representing the number of degrees as ratio (usually between -360.0 degree and 360.0 degree).
   - returns: A DynamicColor object with the hue changed.
   */
  internal final func adjustedHue(amount: CGFloat) -> DynamicColor {
    return HSL(color: self).adjustedHue(amount: amount).toDynamicColor()
  }

  /**
   Creates and returns the complement of the color object.

   This is identical to adjustedHue(180).

   - returns: The complement DynamicColor.
   - seealso: adjustedHueColor:
   */
//  public final func complemented() -> DynamicColor {
//    return adjustedHue(amount: 180)
//  }

  /**
   Creates and returns a color object with the lightness increased by the given amount.

   - parameter amount: CGFloat between 0.0 and 1.0. Default value is 0.2.
   - returns: A lighter DynamicColor.
   */
  internal final func lighter(amount: CGFloat = 0.2) -> DynamicColor {
    return HSL(color: self).lighter(amount: amount).toDynamicColor()
  }

  /**
   Creates and returns a color object with the lightness decreased by the given amount.

   - parameter amount: Float between 0.0 and 1.0. Default value is 0.2.
   - returns: A darker DynamicColor.
   */
  internal final func darkened(amount: CGFloat = 0.2) -> DynamicColor {
    return HSL(color: self).darkened(amount: amount).toDynamicColor()
  }

  /**
   Creates and returns a color object with the saturation increased by the given amount.

   - parameter amount: CGFloat between 0.0 and 1.0. Default value is 0.2.

   - returns: A DynamicColor more saturated.
   */
  internal final func saturated(amount: CGFloat = 0.2) -> DynamicColor {
    return HSL(color: self).saturated(amount: amount).toDynamicColor()
  }

  /**
   Creates and returns a color object with the saturation decreased by the given amount.

   - parameter amount: CGFloat between 0.0 and 1.0. Default value is 0.2.
   - returns: A DynamicColor less saturated.
   */
  internal final func desaturated(amount: CGFloat = 0.2) -> DynamicColor {
    return HSL(color: self).desaturated(amount: amount).toDynamicColor()
  }

  /**
   Creates and returns a color object converted to grayscale.

   This is identical to desaturateColor(1).

   - returns: A grayscale DynamicColor.
   - seealso: desaturateColor:
   */
  internal final func grayscaled() -> DynamicColor {
    return desaturated(amount: 1)
  }

  /**
   Creates and return a color object where the red, green, and blue values are inverted, while the alpha channel is left alone.

   - returns: An inverse (negative) of the original color.
   */
  internal final func inverted() -> DynamicColor {
    let rgba = toRGBAComponents()

    let invertedRed   = 1 - rgba.r
    let invertedGreen = 1 - rgba.g
    let invertedBlue  = 1 - rgba.b

    return DynamicColor(red: invertedRed, green: invertedGreen, blue: invertedBlue, alpha: rgba.a)
  }
}
