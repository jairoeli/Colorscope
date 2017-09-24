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

    self.currentBackground.snp.makeConstraints { make in
      if #available(iOS 11.0, *) {
        make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
      } else {
        make.top.equalToSuperview()
      }
      make.left.right.bottom.equalToSuperview()
    }

    self.numberLabel.snp.makeConstraints { make in
      make.top.equalTo(self.currentBackground.snp.centerY).offset(-5)
      make.left.equalTo(16)
    }

  }

}
