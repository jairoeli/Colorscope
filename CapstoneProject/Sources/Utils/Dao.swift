//
//  ThenExtension.swift
//  CapstoneProject
//
//  Created by Jairo Eli de Leon on 9/30/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

protocol Dao {}
extension NSObject: Dao {}

extension Dao where Self: NSObject {

  init(closure: (Self) -> Void) {
    self.init()
    closure(self)
  }

}

extension Dao where Self: UIButton {

  init(type: UIButtonType, closure: (Self) -> Void) {
    self = UIButton(type: type) as! Self
    // swiftlint:disable:previous force_cast
    closure(self)
  }

}
