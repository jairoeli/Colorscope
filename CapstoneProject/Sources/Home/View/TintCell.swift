//
//  TintCell.swift
//  ColorHarmonies
//
//  Created by Jairo Eli de Leon on 10/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TintCell: UICollectionViewCell {

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  var updatedTint: Tint? {
    didSet {

      if let label = updatedTint?.hexLabel {
        numberLabel.text = label
      }

      if let labelColor = updatedTint?.hexLabelColor {
        numberLabel.textColor = labelColor
      }

      if let currentColor = updatedTint?.currentColor {
        currentBackground.backgroundColor = currentColor
      }

    }
  }

  // MARK: Properties

  let numberLabel = UILabel {
    $0.text = "#FFFFFF"
    $0.font = FontBook.Medium.of(size: 18)
    $0.textColor = Eden.Independence.color
  }

  var currentBackground = UIView {
    $0.backgroundColor = .clear
  }

  // MARK: Setup

  func setupViews() {
    addSubview(currentBackground)
    addSubview(numberLabel)

    _ = currentBackground.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

    _ = numberLabel.anchor(top: currentBackground.centerYAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: -5, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    numberLabel.centerXAnchor.constraint(equalTo: centerXAnchor)

  }

}
