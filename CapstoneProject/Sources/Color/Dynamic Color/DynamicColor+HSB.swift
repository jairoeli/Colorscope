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

// MARK: HSB Color Space

extension DynamicColor {
  // MARK: - Getting the HSB Components

  /**
   Returns the HSB (hue, saturation, brightness) components.

   - returns: The HSB components as a tuple (h, s, b).
   */
  public final func toHSBComponents() -> (h: CGFloat, s: CGFloat, b: CGFloat) {
    var h: CGFloat = 0
    var s: CGFloat = 0
    var b: CGFloat = 0

    #if os(iOS) || os(tvOS) || os(watchOS)
      getHue(&h, saturation: &s, brightness: &b, alpha: nil)

      return (h: roundDecimal(h), s: roundDecimal(s), b: roundDecimal(b))
    #elseif os(OSX)
      if isEqual(DynamicColor.black) {
        return (0, 0, 0)
      } else if isEqual(DynamicColor.white) {
        return (0, 0, 1)
      }

      getHue(&h, saturation: &s, brightness: &b, alpha: nil)

      return (h: roundDecimal(h), s: roundDecimal(s), b: roundDecimal(b))
    #endif
  }

  #if os(iOS) || os(tvOS) || os(watchOS)
  /**
   The hue component as CGFloat between 0.0 to 1.0.
   */
  public final var hueComponent: CGFloat {
  return toHSBComponents().h
  }

  /**
   The saturation component as CGFloat between 0.0 to 1.0.
   */
  public final var saturationComponent: CGFloat {
  return toHSBComponents().s
  }

  /**
   The brightness component as CGFloat between 0.0 to 1.0.
   */
  public final var brightnessComponent: CGFloat {
  return toHSBComponents().b
  }
  #endif
}
