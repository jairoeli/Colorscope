//
//  ColorHarmoniesController + Helper.swift
//  Colorscope
//
//  Created by Jairo Eli de Leon on 11/2/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

extension ColorHarmoniesController {

  override var prefersStatusBarHidden: Bool {
    return !iPhoneX()
  }

  // MARK: - Setup
  func setupView() {
    view.addSubview(navBar)
    view.addSubview(titleLabel)
    view.addSubview(cancelBackground)
    view.addSubview(dismissButton)
    view.addSubview(infoButton)
    view.addSubview(infoBackground)
    view.addSubview(copyButton)
    view.addSubview(copyBackground)

    self.navBar.snp.makeConstraints { make in
      if #available(iOS 11.0, *), iPhoneX() == true {
        make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
        make.left.right.equalToSuperview()
        make.height.equalTo(34)
      } else {
        make.top.equalTo(view.snp.top).offset(16)
      }
    }

    self.dismissButton.snp.makeConstraints { (make) in
      make.top.equalTo(navBar.snp.top).offset(8)
      make.left.equalTo(10)
      make.size.equalTo(16)
    }

    self.cancelBackground.snp.makeConstraints { make in
      make.top.equalTo(navBar.snp.top)
      make.left.equalToSuperview()
      make.bottom.equalTo(navBar.snp.bottom)
      make.width.equalTo(40)
    }

    self.copyButton.snp.makeConstraints { make in
      make.top.equalTo(navBar.snp.top).offset(8)
      make.centerX.equalToSuperview()
      make.size.equalTo(16)
    }

    self.copyBackground.snp.makeConstraints { make in
      make.top.equalTo(navBar.snp.top)
      make.centerX.equalToSuperview()
      make.bottom.equalTo(navBar.snp.bottom)
      make.width.equalTo(40)
    }

    self.infoButton.snp.makeConstraints { make in
      make.top.equalTo(navBar.snp.top).offset(8)
      make.right.equalTo(-10)
      make.size.equalTo(18)
    }

    self.infoBackground.snp.makeConstraints { make in
      make.top.equalTo(navBar.snp.top)
      make.bottom.equalTo(navBar.snp.bottom)
      make.right.equalToSuperview()
      make.width.equalTo(44)
    }

    self.titleLabel.snp.makeConstraints { make in
      if #available(iOS 11.0, *) {
        make.top.equalTo(navBar.safeAreaLayoutGuide.snp.bottomMargin).offset(DeviceSize.adjust(38, for: [.iphoneX: 20]))
      } else {
        make.top.equalTo(navBar.snp.bottom).offset(38)
      }
      make.centerX.equalToSuperview()
    }
  }

  // MARK: - Handle Action

  @objc func handleCopying() {
    let indexPath = collectionView.indexPathsForVisibleItems[0]

    switch indexPath.item {
    case 0:
      guard let cell = collectionView.cellForItem(at: indexPath) as? ComplementaryCell,
        let hexLabel = cell.hexLabel.text,
        let complementaryLabel = cell.complementaryLabel.text else { return }

      let message = "\(hexLabel)\n\(complementaryLabel)"
      let popup = PopupDialog(title: "Hex Values", message: message, buttonAlignment: .horizontal, transitionStyle: .zoomIn, gestureDismissal: true)

      let buttonOne = CancelButton(title: "Cancel", action: nil)
      let buttonTwo = DefaultButton(title: "Copy", action: {
        let pasteboard = UIPasteboard.general
        pasteboard.string = message
      })

      popup.addButtons([buttonOne, buttonTwo])
      self.present(popup, animated: true, completion: nil)

    case 1:
      guard let cell = collectionView.cellForItem(at: indexPath) as? AnalogousCell,
        let analogous = cell.analogousLabel.text,
        let analogous1 = cell.analogousLabel2.text,
        let analogous2 = cell.analogousLabel3.text else { return }

      let message = "\(analogous)\n\(analogous1)\n\(analogous2)"
      let popup = PopupDialog(title: "Hex Values", message: message, buttonAlignment: .horizontal, transitionStyle: .zoomIn, gestureDismissal: true)

      let buttonOne = CancelButton(title: "Cancel", action: nil)
      let buttonTwo = DefaultButton(title: "Copy", action: {
        let pasteboard = UIPasteboard.general
        pasteboard.string = message
      })

      popup.addButtons([buttonOne, buttonTwo])
      self.present(popup, animated: true, completion: nil)

    case 2:
      guard let cell = collectionView.cellForItem(at: indexPath) as? TriadicCell,
        let triadic = cell.triadicLabel.text,
        let triadic2 = cell.triadicLabel2.text,
        let triadic3 = cell.triadicLabel3.text else { return }

      let message = "\(triadic)\n\(triadic2)\n\(triadic3)"
      let popup = PopupDialog(title: "Hex Values", message: message, buttonAlignment: .horizontal, transitionStyle: .zoomIn, gestureDismissal: true)

      let buttonOne = CancelButton(title: "Cancel", action: nil)
      let buttonTwo = DefaultButton(title: "Copy", action: {
        let pasteboard = UIPasteboard.general
        pasteboard.string = message
      })

      popup.addButtons([buttonOne, buttonTwo])
      self.present(popup, animated: true, completion: nil)

    case 3:
      guard let cell = collectionView.cellForItem(at: indexPath) as? TetradicCell,
        let tetradic = cell.tetradicLabel.text,
        let tetradic2 = cell.tetradicLabel2.text,
        let tetradic3 = cell.tetradicLabel3.text,
        let tetradic4 = cell.tetradicLabel4.text else { return }

      let message = "\(tetradic)\n\(tetradic2)\n\(tetradic3)\n\(tetradic4)"
      let popup = PopupDialog(title: "Hex Values", message: message, buttonAlignment: .horizontal, transitionStyle: .zoomIn, gestureDismissal: true)

      let buttonOne = CancelButton(title: "Cancel", action: nil)
      let buttonTwo = DefaultButton(title: "Copy", action: {
        let pasteboard = UIPasteboard.general
        pasteboard.string = message
      })

      popup.addButtons([buttonOne, buttonTwo])
      self.present(popup, animated: true, completion: nil)

    default:
      break
    }
  }

}
