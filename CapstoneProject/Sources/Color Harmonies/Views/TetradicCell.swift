//
//  TetradicCell.swift
//  ColorHarmonies
//
//  Created by Jairo Eli de Leon on 10/12/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TetradicCell: UICollectionViewCell {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  var updatedTetradic: TetradicHarmony? {
    didSet {
      
      // Current Color
      if let currentColor = updatedTetradic?.currentColorBackground {
        tetradicBackgroundColor.backgroundColor = currentColor
      }
      
      if let currentColorLabel = updatedTetradic?.hexLabel {
        tetradicLabel.text = currentColorLabel
      }
      
      if let labelColor = updatedTetradic?.hexLabelColor {
        tetradicLabel.textColor = labelColor
      }
      
      // Tetradic #1
      if let tet1 = updatedTetradic?.tetradicColor {
        tetradicBackgroundColor2.backgroundColor = tet1
      }
      
      if let tetLabel = updatedTetradic?.tetradicLabel {
        tetradicLabel2.text = tetLabel
      }
      
      if let tetLabelColor = updatedTetradic?.tetradicLabelColor {
        tetradicLabel2.textColor = tetLabelColor
      }
      
      // Tetradic #2
      if let tet2 = updatedTetradic?.tetradicColor2 {
        tetradicBackgroundColor3.backgroundColor = tet2
      }
      
      if let tetLabel2 = updatedTetradic?.tetradicLabel2 {
        tetradicLabel3.text = tetLabel2
      }
      
      if let tetLabelColor2 = updatedTetradic?.tetradicLabelColor2 {
        tetradicLabel3.textColor = tetLabelColor2
      }
      
      // Tetradic #3
      if let tet3 = updatedTetradic?.tetradicColor3 {
        tetradicBackgroundColor4.backgroundColor = tet3
      }
      
      if let tetLabel3 = updatedTetradic?.tetradicLabel3 {
        tetradicLabel4.text = tetLabel3
      }
      
      if let tetLabelColor3 = updatedTetradic?.tetradicLabelColor3 {
        tetradicLabel4.textColor = tetLabelColor3
      }
      
    }
  }
  
  // MARK: Properties
  
  let clearBackground = UIView {
    $0.backgroundColor = .clear
  }
  
  let tetradicBackgroundColor = UIView {
    $0.backgroundColor = DynamicColor(hex: 0xF44336)
  }
  
  let tetradicBackgroundColor2 = UIView {
    $0.backgroundColor = DynamicColor(hex: 0x88F436)
  }
  
  let tetradicBackgroundColor3 = UIView {
    $0.backgroundColor = DynamicColor(hex: 0x36E7F4)
  }
  
  let tetradicBackgroundColor4 = UIView {
    $0.backgroundColor = DynamicColor(hex: 0xA236F4)
  }
  
  let tetradicLabel = UILabel {
    $0.text = "#F44336"
    $0.textColor = .white
    $0.font = FontBook.Medium.of(size: 38)
  }
  
  let tetradicLabel2 = UILabel {
    $0.text = "#88F436"
    $0.textColor = Eden.Independence.color
    $0.font = FontBook.Medium.of(size: 38)
  }
  
  let tetradicLabel3 = UILabel {
    $0.text = "#36E7F4"
    $0.textColor = Eden.Independence.color
    $0.font = FontBook.Medium.of(size: 38)
  }
  
  let tetradicLabel4 = UILabel {
    $0.text = "#A236F4"
    $0.textColor = .white
    $0.font = FontBook.Medium.of(size: 38)
  }
  
  // MARK: Setup
  
  func setupViews() {
    addSubview(clearBackground)
    addSubview(tetradicBackgroundColor)
    addSubview(tetradicBackgroundColor2)
    addSubview(tetradicBackgroundColor3)
    addSubview(tetradicBackgroundColor4)
    addSubview(tetradicLabel)
    addSubview(tetradicLabel2)
    addSubview(tetradicLabel3)
    addSubview(tetradicLabel4)
    
    _ = clearBackground.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 200)
    
    _ = tetradicBackgroundColor.anchor(top: clearBackground.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: (frame.height - 200) / 4)
    
    _ = tetradicLabel.anchor(top: tetradicBackgroundColor.centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    tetradicLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    
    _ = tetradicBackgroundColor2.anchor(top: tetradicBackgroundColor.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: (frame.height - 200) / 4)
    
    _ = tetradicLabel2.anchor(top: tetradicBackgroundColor2.centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    tetradicLabel2.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    
    _ = tetradicBackgroundColor3.anchor(top: tetradicBackgroundColor2.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: (frame.height - 200) / 4)
    
    _ = tetradicLabel3.anchor(top: tetradicBackgroundColor3.centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    tetradicLabel3.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    
    _ = tetradicBackgroundColor4.anchor(top: tetradicBackgroundColor3.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: (frame.height - 200) / 4)
    
    _ = tetradicLabel4.anchor(top: tetradicBackgroundColor4.centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    tetradicLabel4.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
  }
  
}



