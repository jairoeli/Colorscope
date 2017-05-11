//
//  ColorHarmony.swift
//  ColorHarmonies
//
//  Created by Jairo Eli de Leon on 10/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

// MARK: - Complementary
struct ColorHarmony {

  let mainColorBackground: DynamicColor
  let complementaryColor: DynamicColor
  let hexLabel: String
  let hexLabelColor: DynamicColor

  let complementaryHexLabel: String
  let complementaryHexLabelColor: DynamicColor

}

// MARK: - Analogous
struct AnalogousHarmony {

  let currentColorBackground: DynamicColor
  let hexLabel: String
  let hexLabelColor: DynamicColor

  let analogousColor: DynamicColor
  let analogousLabel: String
  let analogousLabelColor: DynamicColor

  let analogousColor2: DynamicColor
  let analogousLabel2: String
  let analogousLabelColor2: DynamicColor

}

// MARK: - Tradic
struct TradicHarmony {

  let currentColorBackground: DynamicColor
  let hexLabel: String
  let hexLabelColor: DynamicColor

  let tridadicColor: DynamicColor
  let tridadicLabel: String
  let tridadicLabelColor: DynamicColor

  let tridadicColor2: DynamicColor
  let tridadicLabel2: String
  let tridadicLabelColor2: DynamicColor

}

// MARK: - Tetradic
struct TetradicHarmony {

  let currentColorBackground: DynamicColor
  let hexLabel: String
  let hexLabelColor: DynamicColor

  let tetradicColor: DynamicColor
  let tetradicLabel: String
  let tetradicLabelColor: DynamicColor

  let tetradicColor2: DynamicColor
  let tetradicLabel2: String
  let tetradicLabelColor2: DynamicColor

  let tetradicColor3: DynamicColor
  let tetradicLabel3: String
  let tetradicLabelColor3: DynamicColor

}
