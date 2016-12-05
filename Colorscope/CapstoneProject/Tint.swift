//
//  Tint.swift
//  ColorHarmonies
//
//  Created by Jairo Eli de Leon on 10/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

struct Tint {
  
  let hexLabel: String
  let hexLabelColor: DynamicColor
  let currentColor: DynamicColor
  
  init(hexLabel: String, hexLabelColor: DynamicColor, currentColor: DynamicColor) {
    self.hexLabel = hexLabel
    self.hexLabelColor = hexLabelColor
    self.currentColor = currentColor
  }
  
}
