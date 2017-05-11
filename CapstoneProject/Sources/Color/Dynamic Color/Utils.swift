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

/**
 Clips the values in an interval.

 Given an interval, values outside the interval are clipped to the interval
 edges. For example, if an interval of [0, 1] is specified, values smaller than
 0 become 0, and values larger than 1 become 1.

 - Parameter v: The value to clipped.
 - Parameter minimum: The minimum edge value.
 - Parameter maximum: The maximum edgevalue.
 */
internal func clip<T: Comparable>(_ v: T, _ minimum: T, _ maximum: T) -> T {
  return max(min(v, maximum), minimum)
}

/**
 Returns the absolute value of the modulo operation.

 - Parameter x: The value to compute.
 - Parameter m: The modulo.
 */
internal func moda(_ x: CGFloat, m: CGFloat) -> CGFloat {
  return (x.truncatingRemainder(dividingBy: m) + m).truncatingRemainder(dividingBy: m)
}

/**
 Rounds the given float to a given decimal precision.
 
 - Parameter x: The value to round.
 - Parameter m: The precision. Default to 10000.
 */
internal func roundDecimal(_ x: CGFloat, precision: CGFloat = 10000) -> CGFloat {
  return CGFloat(Int(round(x * precision))) / precision
}
