//
//  WalkthroughCell.swift
//  ColorHarmonies
//
//  Created by Jairo Eli de Leon on 10/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class WalkthroughPageCell: UICollectionViewCell {

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  var tutorialPage: WalkthroughPage? {
    didSet {

      if let text = tutorialPage?.title {
        textView.text = text
      }

      if let image = tutorialPage?.imageName {
        imageView.image = UIImage(named: image)
      }

      if let paragraph = tutorialPage?.message {
        paragraphView.text = paragraph
      }
    }

  }

  // MARK: Properties

  let imageView = UIImageView {
    $0.image = #imageLiteral(resourceName: "complementary")
    $0.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
  }

  let textView = UILabel {
    $0.text = "SAMPLE TEXT FOR NOW"
    $0.font = FontBook.Medium.of(size: 26)
    $0.textColor = Eden.Independence.color
    $0.textAlignment = .center
  }

  let paragraphView = UILabel {
    $0.text = "SAMPLE TEXT FOR NOW"
    $0.font = FontBook.Medium.of(size: 18)
    $0.textColor = Eden.Gray.color
    $0.textAlignment = .center
    $0.numberOfLines = 4
    $0.sizeToFit()
  }

  let lineSeperatorView = UIView {
    $0.backgroundColor = .clear
  }

  // MARK: Setup

  func setupViews() {
    addSubview(imageView)
    addSubview(textView)
    addSubview(paragraphView)
    addSubview(lineSeperatorView)

    imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: lineSeperatorView.topAnchor, right: rightAnchor)

    textView.anchorWithConstantsToTop(top: lineSeperatorView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 16)

    paragraphView.anchorWithConstantsToTop(top: textView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32)

    _ = lineSeperatorView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: frame.height - 250, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)

  }

}
