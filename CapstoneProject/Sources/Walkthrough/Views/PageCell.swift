//
//  PageCell.swift
//  CapstoneProject
//
//  Created by Jairo Eli de Leon on 9/30/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Properties
  var images: UIImageView = {
    let animate = UIImageView()
    animate.image = #imageLiteral(resourceName: "ex1")
    animate.contentMode = .scaleAspectFill
    animate.clipsToBounds = true

    animate.animationImages = [UIImage(named: "ex1")!,
                               UIImage(named: "ex2")!,
                               UIImage(named: "ex3")!,
                               UIImage(named: "ex4")!,
                               UIImage(named: "ex5")!,
                               UIImage(named: "ex6")!,
                               UIImage(named: "ex7")!,
                               UIImage(named: "ex8")!,
                               UIImage(named: "ex9")!,
                               UIImage(named: "ex10")!]

    animate.animationDuration = 4
    animate.startAnimating()
    return animate
  }()

  let textView = UILabel {
    $0.text = "Explore colors"
    $0.font = FontBook.Medium.of(size: 24)
    $0.textColor = Eden.Independence.color
    $0.textAlignment = .center
  }

  let paragraphView = UILabel {
    $0.text = "Tap here to generate monochromatic color schemes!"
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
    addSubview(images)
    addSubview(textView)
    addSubview(paragraphView)
    addSubview(lineSeperatorView)

    images.anchorToTop(top: topAnchor, left: leftAnchor, bottom: lineSeperatorView.topAnchor, right: rightAnchor)

    textView.anchorWithConstantsToTop(top: lineSeperatorView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 16)

    paragraphView.anchorWithConstantsToTop(top: textView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 28, bottomConstant: 0, rightConstant: 28)

    _ = lineSeperatorView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: frame.height - 160, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
  }

}
