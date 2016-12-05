//
//  ColorHarmony.swift
//  ColorHarmonies
//
//  Created by Jairo Eli de Leon on 10/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

struct ColorHarmony {
  
  let mainColorBackground: DynamicColor
  let complementaryColor: DynamicColor
  let hexLabel: String
  let hexLabelColor: DynamicColor
  let complementaryHexLabel: String
  let complementaryHexLabelColor: DynamicColor
  
  init(mainColorBackground: DynamicColor, complementaryColor: DynamicColor, hexLabel: String, hexLabelColor: DynamicColor, complementaryHexLabel: String, complementaryHexLabelColor: DynamicColor) {
    
    self.mainColorBackground = mainColorBackground
    self.complementaryColor = complementaryColor
    self.hexLabel = hexLabel
    self.hexLabelColor = hexLabelColor
    self.complementaryHexLabel = complementaryHexLabel
    self.complementaryHexLabelColor = complementaryHexLabelColor
  }
  
}

struct AnalogousHarmony {
  
  let currentColorBackground: DynamicColor
  let analogousColor: DynamicColor
  let analogousColor2: DynamicColor
  
  let hexLabel: String
  let hexLabelColor: DynamicColor
  
  let analogousLabel: String
  let analogousLabelColor: DynamicColor
  
  let analogousLabel2: String
  let analogousLabelColor2: DynamicColor
  
  init(currentColorBackground: DynamicColor,
       hexLabel: String,
       hexLabelColor: DynamicColor,
       analogousColor: DynamicColor,
       analogousLabel: String,
       analogousLabelColor: DynamicColor,
       analogousColor2: DynamicColor,
       analogousLabel2: String,
       analogousLabelColor2: DynamicColor) {
    
    self.currentColorBackground = currentColorBackground
    self.hexLabel = hexLabel
    self.hexLabelColor = hexLabelColor
    
    self.analogousColor = analogousColor
    self.analogousLabel = analogousLabel
    self.analogousLabelColor = analogousLabelColor
    
    self.analogousColor2 = analogousColor2
    self.analogousLabel2 = analogousLabel2
    self.analogousLabelColor2 = analogousLabelColor2
  }
  
}

struct TradicHarmony {
  
  let currentColorBackground: DynamicColor
  let tridadicColor: DynamicColor
  let tridadicColor2: DynamicColor
  
  let hexLabel: String
  let hexLabelColor: DynamicColor
  
  let tridadicLabel: String
  let tridadicLabelColor: DynamicColor
  
  let tridadicLabel2: String
  let tridadicLabelColor2: DynamicColor
  
  init(currentColorBackground: DynamicColor,
       hexLabel: String,
       hexLabelColor: DynamicColor,
       tridadicColor: DynamicColor,
       tridadicLabel: String,
       tridadicLabelColor: DynamicColor,
       tridadicColor2: DynamicColor,
       tridadicLabel2: String,
       tridadicLabelColor2: DynamicColor) {
    
    self.currentColorBackground = currentColorBackground
    self.hexLabel = hexLabel
    self.hexLabelColor = hexLabelColor
    
    self.tridadicColor = tridadicColor
    self.tridadicLabel = tridadicLabel
    self.tridadicLabelColor = tridadicLabelColor
    
    self.tridadicColor2 = tridadicColor2
    self.tridadicLabel2 = tridadicLabel2
    self.tridadicLabelColor2 = tridadicLabelColor2
  }
  
}

struct TetradicHarmony {
  
  let currentColorBackground: DynamicColor
  let tetradicColor: DynamicColor
  let tetradicColor2: DynamicColor
  let tetradicColor3: DynamicColor
  
  let hexLabel: String
  let hexLabelColor: DynamicColor
  
  let tetradicLabel: String
  let tetradicLabelColor: DynamicColor
  
  let tetradicLabel2: String
  let tetradicLabelColor2: DynamicColor
  
  let tetradicLabel3: String
  let tetradicLabelColor3: DynamicColor
  
  init(currentColorBackground: DynamicColor,
       hexLabel: String,
       hexLabelColor: DynamicColor,
       tetradicColor: DynamicColor,
       tetradicLabel: String,
       tetradicLabelColor: DynamicColor,
       tetradicColor2: DynamicColor,
       tetradicLabel2: String,
       tetradicLabelColor2: DynamicColor,
       tetradicColor3: DynamicColor,
       tetradicLabel3: String,
       tetradicLabelColor3: DynamicColor) {
    
    self.currentColorBackground = currentColorBackground
    self.hexLabel = hexLabel
    self.hexLabelColor = hexLabelColor
    
    self.tetradicColor = tetradicColor
    self.tetradicLabel = tetradicLabel
    self.tetradicLabelColor = tetradicLabelColor
    
    self.tetradicColor2 = tetradicColor2
    self.tetradicLabel2 = tetradicLabel2
    self.tetradicLabelColor2 = tetradicLabelColor2
    
    self.tetradicColor3 = tetradicColor3
    self.tetradicLabel3 = tetradicLabel3
    self.tetradicLabelColor3 = tetradicLabelColor3
  }
  
}



