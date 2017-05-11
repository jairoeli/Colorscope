//
//  HarmonyCell.swift
//  ColorHarmonies
//
//  Created by Jairo Eli de Leon on 10/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ComplementaryCell: UICollectionViewCell {

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

//  var color: DynamicColor?

  var updateComplementaryColors: ColorHarmony? {
    didSet {

      // Key color

      if let keyBackgroundColor = updateComplementaryColors?.mainColorBackground {
        mainKeyColor.backgroundColor = keyBackgroundColor
      }

      if let numberLabel = updateComplementaryColors?.hexLabel {
        hexLabel.text = numberLabel
      }

      if let keyTextColor = updateComplementaryColors?.hexLabelColor {
        hexLabel.textColor = keyTextColor
      }

      // Complementary color

      if let complementary = updateComplementaryColors?.complementaryColor {
        complementaryBackgroundColor.backgroundColor = complementary
      }

      if let compLabel = updateComplementaryColors?.complementaryHexLabel {
        complementaryLabel.text = compLabel
      }

      if let compLabelColor = updateComplementaryColors?.complementaryHexLabelColor {
        complementaryLabel.textColor = compLabelColor
      }

    }
  }

// MARK: - Properties

  let clearBackground = UIView {
    $0.backgroundColor = .clear
  }

  let mainKeyColor = UIView {
    $0.backgroundColor = DynamicColor(hex: 0xF44336)
  }

  let hexLabel = UILabel {
    $0.text = "#F44336"
    $0.textColor = .white
    $0.font = FontBook.Medium.of(size: 38)
  }

  let complementaryBackgroundColor = UIView {
    $0.backgroundColor = DynamicColor(hex: 0x36E7F4)
  }

  let complementaryLabel = UILabel {
    $0.text = "#36E7F4"
    $0.textColor = Eden.Independence.color
    $0.font = FontBook.Medium.of(size: 38)
  }

  // MARK: - Setup

  func setupViews() {
    addSubview(clearBackground)
    addSubview(mainKeyColor)
    addSubview(hexLabel)
    addSubview(complementaryBackgroundColor)
    addSubview(complementaryLabel)

    _ = clearBackground.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 200)

    _ = mainKeyColor.anchor(top: clearBackground.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: (frame.height - 200) / 2)

    _ = hexLabel.anchor(top: mainKeyColor.centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -30, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    hexLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

    _ = complementaryBackgroundColor.anchor(top: mainKeyColor.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: (frame.height - 200) / 2)

    _ = complementaryLabel.anchor(top: complementaryBackgroundColor.centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -30, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    complementaryLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

  }

}
