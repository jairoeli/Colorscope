//
//  Stylesheet.swift
//  CapstoneProject
//
//  Created by Jairo Eli de Leon on 10/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

enum FontBook: String {
  case Book = "GothamRounded-Book"
  case Medium =  "GothamRounded-Medium"

  func of(size: CGFloat) -> UIFont {
    return UIFont(name: self.rawValue, size: size)!
  }
}

enum Eden: CustomStringConvertible {

  case Independence
  case Gray

  var description: String {
    switch self {
    case .Independence: return "#383754"
    case .Gray: return "#8F8F8F"
    }
  }

  var color: UIColor {
    return DynamicColor(hexString: self.description)
  }
}

// MARK: Animation

func spring(duration: TimeInterval, animations: (() -> Void)!) {

  UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {

    animations()

    }, completion: nil)

}
