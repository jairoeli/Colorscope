////
////  GetStartedCell.swift
////  CapstoneProject
////
////  Created by Jairo Eli de Leon on 10/3/16.
////  Copyright © 2016 DevMountain. All rights reserved.
////

import UIKit

class GetStartedCell: UICollectionViewCell {

  // MARK: Properties

  public weak var delegate: LoginControllerDelegate?

  let logoImageView = UIImageView {
    $0.image = #imageLiteral(resourceName: "wallpaper")
    $0.contentMode = .scaleAspectFill
  }

  lazy var signUp: UIButton = {
    let button = UIButton(type: .system)
    button.backgroundColor = UIColor(white: 0.9, alpha: 1)
    button.setTitle("GET STARTED", for: .normal)
    button.titleLabel?.font = FontBook.Medium.of(size: 18)
    button.setTitleColor(Eden.Independence.color, for: .normal)
    button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    return button
  }()

  let headlineLabel = UILabel {
    $0.text = "Start exploring and discover beautiful color schemes!"
    $0.textColor = Eden.Independence.color
    $0.font = FontBook.Medium.of(size: 22)
    $0.textAlignment = .center
    $0.baselineAdjustment = .alignCenters
    $0.numberOfLines = 3
  }

  let lineSeperatorView = UIView {
    $0.backgroundColor = .clear
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(logoImageView)
    addSubview(signUp)
    addSubview(headlineLabel)
    addSubview(lineSeperatorView)

    _ = logoImageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: lineSeperatorView.topAnchor, right: rightAnchor)

    _ = headlineLabel.anchor(top: lineSeperatorView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 24, leftConstant: 28, bottomConstant: 0, rightConstant: 28, widthConstant: 0, heightConstant: 0)

    if #available(iOS 11.0, *) {
      _ = signUp.anchor(top: nil, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 60)
    } else {
      // Fallback on earlier versions
      _ = signUp.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 60)
    }

    _ = lineSeperatorView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: frame.height - 330, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)

  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Action
  @objc func handleLogin() {
    delegate?.finishLoggingIn()
  }

}
