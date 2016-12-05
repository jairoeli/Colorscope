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

// MARK: RGBA Color Space

public extension DynamicColor {
  /**
   Initializes and returns a color object using the specified opacity and RGB component values.

   Notes that values out of range are clipped.

   - Parameter r: The red component of the color object, specified as a value from 0.0 to 255.0.
   - Parameter g: The green component of the color object, specified as a value from 0.0 to 255.0.
   - Parameter b: The blue component of the color object, specified as a value from 0.0 to 255.0.
   - Parameter a: The opacity value of the color object, specified as a value from 0.0 to 255.0. The default value is 255.
   */
  public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 255) {
    self.init(red: clip(r, 0, 255) / 255, green: clip(g, 0, 255) / 255, blue: clip(b, 0, 255) / 255, alpha: clip(a, 0, 255) / 255)
  }

  // MARK: - Getting the RGBA Components

  /**
   Returns the RGBA (red, green, blue, alpha) components.

   - returns: The RGBA components as a tuple (r, g, b, a).
   */
  public final func toRGBAComponents() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
    var r: CGFloat = 0
    var g: CGFloat = 0
    var b: CGFloat = 0
    var a: CGFloat = 0

    #if os(iOS) || os(tvOS) || os(watchOS)
      getRed(&r, green: &g, blue: &b, alpha: &a)

      return (r, g, b, a)
    #elseif os(OSX)
      if isEqual(DynamicColor.black) {
        return (0, 0, 0, 0)
      }
      else if isEqual(DynamicColor.white) {
        return (1, 1, 1, 1)
      }

      getRed(&r, green: &g, blue: &b, alpha: &a)

      return (r, g, b, a)
    #endif
  }

  #if os(iOS) || os(tvOS) || os(watchOS)
  /**
   The red component as CGFloat between 0.0 to 1.0.
   */
  public final var redComponent: CGFloat {
  return toRGBAComponents().r
  }

  /**
   The green component as CGFloat between 0.0 to 1.0.
   */
  public final var greenComponent: CGFloat {
  return toRGBAComponents().g
  }

  /**
   The blue component as CGFloat between 0.0 to 1.0.
   */
  public final var blueComponent: CGFloat {
  return toRGBAComponents().b
  }

  /**
   The alpha component as CGFloat between 0.0 to 1.0.
   */
  public final var alphaComponent: CGFloat {
  return toRGBAComponents().a
  }
  #endif

  // MARK: - Setting the RGBA Components

  /**
   Creates and returns a color object with the alpha increased by the given amount.

   - parameter amount: CGFloat between 0.0 and 1.0.
   - returns: A color object with its alpha channel modified.
   */
  internal final func adjustedAlpha(amount: CGFloat) -> DynamicColor {
    let components      = toRGBAComponents()
    let normalizedAlpha = clip(components.a + amount, 0, 1)

    return DynamicColor(red: components.r, green: components.g, blue: components.b, alpha: normalizedAlpha)
  }  
}
