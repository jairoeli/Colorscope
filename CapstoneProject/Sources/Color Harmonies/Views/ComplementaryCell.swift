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

    self.clearBackground.snp.makeConstraints { make in
      make.top.left.right.equalToSuperview()
      make.height.equalTo(200)
    }

    self.mainKeyColor.snp.makeConstraints { make in
      make.top.equalTo(self.clearBackground.snp.bottom)
      make.left.right.equalToSuperview()
      make.height.equalTo((frame.height - 200) / 2)
    }

    self.hexLabel.snp.makeConstraints { make in
      make.top.equalTo(mainKeyColor.snp.centerY).offset(-25)
      make.centerX.equalToSuperview()
    }

    self.complementaryBackgroundColor.snp.makeConstraints { make in
      make.top.equalTo(self.mainKeyColor.snp.bottom)
      make.left.right.equalToSuperview()
      make.height.equalTo((frame.height - 200) / 2)
    }

    self.complementaryLabel.snp.makeConstraints { make in
      make.top.equalTo(self.complementaryBackgroundColor.snp.centerY).offset(-25)
      make.centerX.equalToSuperview()
    }

  }

}
