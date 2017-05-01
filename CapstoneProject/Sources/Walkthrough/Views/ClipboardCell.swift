//
//  ClipboardCell.swift
//  Colorscope
//
//  Created by Jairo Eli de Leon on 11/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ClipboardCell: UICollectionViewCell {

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Properties

  let imageView = UIImageView {
    $0.image = #imageLiteral(resourceName: "clipboard")
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
  }

  let textView = UILabel {
    $0.text = "Universal Clipboard"
    $0.font = FontBook.Medium.of(size: 24)
    $0.textColor = Eden.Independence.color
    $0.textAlignment = .center
  }

  let paragraphView = UILabel {
    $0.text = "Tap to copy the color scheme you like on to the clipboard."
    $0.font = FontBook.Medium.of(size: 18)
    $0.textColor = Eden.Gray.color
    $0.textAlignment = .center
    $0.numberOfLines = 3
  }

  let lineSeperatorView = UIView {
    $0.backgroundColor = .clear //UIColor(white: 0.9, alpha: 1)
  }

  // MARK: Setup
  func setupViews() {
    addSubview(imageView)
    addSubview(textView)
    addSubview(paragraphView)
    addSubview(lineSeperatorView)

    imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: lineSeperatorView.topAnchor, right: rightAnchor)

    textView.anchorWithConstantsToTop(top: lineSeperatorView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 16)

    paragraphView.anchorWithConstantsToTop(top: textView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 28, bottomConstant: 0, rightConstant: 28)

    _ = lineSeperatorView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: frame.height - 160, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
  }

}
