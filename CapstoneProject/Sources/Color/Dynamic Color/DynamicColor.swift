//
//  ColorExtension.swift
//  ColorHarmonies
//
//  Created by Jairo Eli de Leon on 10/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

/**
 Extension to manipulate colours easily.
 
 It allows you to work hexadecimal strings, RGB & CYMK components and color harmonies...
 */
typealias DynamicColor = UIColor

extension DynamicColor {
  // MARK: - Manipulating Hexa-decimal Values and Strings

  /**
   Creates a color from an hex string (e.g. "#3498db").
   
   If the given hex string is invalid the initialiser will create a black color.
   
   - parameter hexString: A hexa-decimal color string representation.
   */
  convenience init(hexString: String) {
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var alpha: CGFloat = 1.0

    if hexString.hasPrefix("#") {
      //      let index   = rgba.startIndex.advancedBy(1)
      let index = hexString.index(hexString.startIndex, offsetBy: 1)
      let hex = hexString.substring(from: index)
      let scanner = Scanner(string: hex)
      var hexValue: UInt32 = 0

      if scanner.scanHexInt32(&hexValue) {
        switch (hex.characters.count) {
        case 3:
          red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
          green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
          blue  = CGFloat(hexValue & 0x00F)              / 15.0
        case 4:
          red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
          green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
          blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
          alpha = CGFloat(hexValue & 0x000F)             / 15.0
        case 6:
          red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
          green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
          blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
        case 8:
          red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
          green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
          blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
          alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
        default:
          print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
        }
      } else {
        print("Scan hex error")
      }
    } else {
      print("Invalid RGB string, missing '#' as prefix", terminator: "")
    }
    self.init(red:red, green:green, blue:blue, alpha:alpha)
  }

  /**
   Creates a color from an hex integer (e.g. 0x3498db).
   
   - parameter hex: A hexa-decimal UInt32 that represents a color.
   */
  public convenience init(hex: UInt32) {
    let mask = 0x000000FF

    let r = Int(hex >> 16) & mask
    let g = Int(hex >> 8) & mask
    let b = Int(hex) & mask

    let red   = CGFloat(r) / 255
    let green = CGFloat(g) / 255
    let blue  = CGFloat(b) / 255

    self.init(red:red, green:green, blue:blue, alpha: 1)
  }

  /**
   Returns the color representation as hexadecimal string.
   
   - returns: A string similar to this pattern "#f4003b".
   */

  public func toHexString(_ includeAlpha: Bool = true) -> String {
    var r: CGFloat = 0
    var g: CGFloat = 0
    var b: CGFloat = 0
    var a: CGFloat = 0
    self.getRed(&r, green: &g, blue: &b, alpha: &a)

    if (includeAlpha) {
      return String(format: "#%02X%02X%02X%", Int(r * 255), Int(g * 255), Int(b * 255), Int(a * 255))
    } else {
      return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
    }
  }

  /**
   Returns the color representation as an integer.
   
   - returns: A UInt32 that represents the hexa-decimal color.
   */
  func toHex() -> UInt32 {
    func roundToHex(_ x: CGFloat) -> UInt32 {
      return UInt32(round(1000 * x) / 1000 * 255)
    }

    let rgba       = toRGBAComponents()
    let colorToInt = roundToHex(rgba.r) << 16 | roundToHex(rgba.g) << 8 | roundToHex(rgba.b)

    return colorToInt
  }

  /**
   Returns the color representation as RGB.
   
   - returns: A color that represents the RGB.
   */
  func rgba() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
    let components = self.cgColor.components
    let numberOfComponents = self.cgColor.numberOfComponents

    switch numberOfComponents {
    case 4:
      return (components![0], components![1], components![2], components![3])
    case 2:
      return (components![0], components![0], components![0], components![1])
    default:
      // FIXME: Fallback to black
      return (0, 0, 0, 1)
    }
  }

  typealias TransformBlock = (CGFloat) -> CGFloat
  /**
   Returns the color representation as CYMK.
   
   - returns: A color that represents the CYMK.
   */
  func cmyk() -> (c: CGFloat, m: CGFloat, y: CGFloat, k: CGFloat) {
    // Convert RGB to CMY
    let rgbaT = rgba()
    let C = 1 - rgbaT.r
    let M = 1 - rgbaT.g
    let Y = 1 - rgbaT.b

    // Find K
    let K = min(1, min(C, min(Y, M)))
    if (K == 1) {
      return (0, 0, 0, 1)
    }

    // Convert cmyk
    let newCMYK: TransformBlock = { x in
      return (x - K)/(1 - K)
    }
    return (newCMYK(C), newCMYK(M), newCMYK(Y), K)
  }

  // MARK: - Identifying and Comparing Colors

  /**
   Returns a boolean value that indicates whether the receiver is equal to the given hexa-decimal string.
   
   - parameter hexString: A hexa-decimal color number representation to be compared to the receiver.
   - returns: true if the receiver and the string are equals, otherwise false.
   */
  public func isEqual(toHexString hexString: String) -> Bool {
    return self.toHexString() == hexString
  }

  /**
   Returns a boolean value that indicates whether the receiver is equal to the given hexa-decimal integer.
   
   - parameter hex: A UInt32 that represents the hexa-decimal color.
   - returns: true if the receiver and the integer are equals, otherwise false.
   */
  public func isEqual(toHex hex: UInt32) -> Bool {
    return self.toHex() == hex
  }

  // MARK: - Querying Colors

  /**
   Determines if the color object is dark or light.
   
   It is useful when you need to know whether you should display the text in black or white.
   
   - returns: A value to know whether the color is light. If the color is light, then use black.
   */
  func isLight() -> DynamicColor {
    let rgbaT = rgba()
    let value = 1 - ((0.299 * rgbaT.r) + (0.587 * rgbaT.g) + (0.114 * rgbaT.b))
    return value < 0.5 ? DynamicColor(hue: 242, saturation: 0, brightness: 0, alpha: 0.36) : DynamicColor(hue: 242, saturation: 0, brightness: 1, alpha: 0.36)
  }

}

extension DynamicColor {

  // MARK: Color Harmonies

  var complemented: DynamicColor {
    return self.withHue(offset: 180 / 360)
  }

  var triadic0: DynamicColor {
    return self.withHue(offset: 120 / 360)
  }

  var triadic1: DynamicColor {
    return self.withHue(offset: 240 / 360)
  }

  var tetradic0: DynamicColor {
    return self.withHue(offset: 90 / 360)
  }

  var tetradic1: DynamicColor {
    return self.complemented
  }

  var tetradic2: DynamicColor {
    return self.withHue(offset: 270 / 360)
  }

  var analagous: DynamicColor {
    return self.withHue(offset: 30 / 360)
  }

  var analagous1: DynamicColor {
    return self.withHue(offset: 60 / 360)
  }

  func withHue(offset: CGFloat) -> UIColor {
    var h: CGFloat = 0
    var s: CGFloat = 0
    var b: CGFloat = 0
    var a: CGFloat = 0
    self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
    return DynamicColor(hue: fmod(h + offset, 1), saturation: s, brightness: b, alpha: a)
  }
}
