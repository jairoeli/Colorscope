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
    return true
  }

  // MARK: - Setup
  func setupView() {
    view.addSubview(titleLabel)
    view.addSubview(dismissButton)
    view.addSubview(cancelBackground)
    view.addSubview(infoButton)
    view.addSubview(infoBackground)
    view.addSubview(copyButton)
    view.addSubview(copyBackground)

    _ = titleLabel.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 85, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    _ = cancelBackground.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 70, heightConstant: 70)

    _ = dismissButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 24, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 16, heightConstant: 16)

    _ = infoBackground.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 70, heightConstant: 70)

    _ = infoButton.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 24, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 20, heightConstant: 20)

    _ = copyButton.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 24, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
    copyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    _ = copyBackground.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 4, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 60)
    copyBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
