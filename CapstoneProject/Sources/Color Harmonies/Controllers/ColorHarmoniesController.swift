//
//  ColorHarmoniesController.swift
//  ColorHarmonies
//
//  Created by Jairo Eli de Leon on 10/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ColorHarmoniesController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  // MARK: - Properties
  fileprivate let cellId = "cellId"
  fileprivate let analogousId = "analogousId"
  fileprivate let triadicId = "triadicId"
  fileprivate let tetradicId = "tetradicId"

  let titles = ["Complementary", "Analogous", "Triadic", "Tetradic"]
  var color: DynamicColor?

  // MARK: - UI Elements

  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.dataSource = self
    cv.delegate = self
    cv.backgroundColor = .white
    cv.isPagingEnabled = true
    return cv
  }()

  let titleLabel = UILabel {
    $0.text = "Complementary"
    $0.textColor = Eden.Independence.color
    $0.font = FontBook.Medium.of(size: 32)
    $0.textAlignment = .center
  }

  lazy var cancelBackground: UIButton = {
    let button = UIButton(type: .system)
    button.backgroundColor = .clear
    button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
    return button
  }()

  lazy var infoBackground: UIButton = {
    let button = UIButton(type: .system)
    button.backgroundColor = .clear
    button.addTarget(self, action: #selector(handleInfo), for: .touchUpInside)
    return button
  }()

  let dismissButton = UIImageView {
    $0.image = #imageLiteral(resourceName: "left arrow").withRenderingMode(.alwaysTemplate)
    $0.tintColor = Eden.Independence.color
  }

  let infoButton = UIImageView {
    $0.image = #imageLiteral(resourceName: "info").withRenderingMode(.alwaysTemplate)
    $0.tintColor = Eden.Independence.color
  }

  let copyButton = UIImageView {
    $0.image = #imageLiteral(resourceName: "copy").withRenderingMode(.alwaysTemplate)
    $0.tintColor = Eden.Independence.color
  }

  lazy var copyBackground: UIButton = {
    let button = UIButton(type: .system)
    button.backgroundColor = .clear
    button.addTarget(self, action: #selector(handleCopying), for: .touchUpInside)
    return button
  }()

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(collectionView)
    collectionView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    collectionView.showsHorizontalScrollIndicator = false

    setupTabBar()
    setupView()
    registerCells()
  }

  // MARK: - Handle Actions
  func handleDismiss() {
    _ = navigationController?.popViewController(animated: true)
  }

  func handleInfo() {
    let controller = TutorialController()
    navigationController?.present(controller, animated: true, completion: nil)
  }

  // MARK: - Tab Bar

  lazy var tabBar: TabBarController = {
    let tb = TabBarController()
    tb.colorHarmoniesController = self
    return tb
  }()

  fileprivate func setupTabBar() {
    view.addSubview(tabBar)
    view.addConstraints(withFormat: "H:|[v0]|", views: tabBar)
    view.addConstraints(withFormat: "V:|-150-[v0(50)]", views: tabBar)
  }

  // MARK: - Scroll
  func scrollToMenuIndex(_ menuIndex: Int) {
    let indexPath = IndexPath(item: menuIndex, section: 0)
    collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition(), animated: true)

    setTitleForIndex(menuIndex)
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    tabBar.horizontalLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 4
  }

  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let index = targetContentOffset.pointee.x / view.frame.width

    let indexPath = IndexPath(item: Int(index), section: 0)
    tabBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionViewScrollPosition())

    setTitleForIndex(Int(index))
  }

  fileprivate func setTitleForIndex(_ index: Int) {
    titleLabel.text = " \(titles[index])"
  }

}

extension ColorHarmoniesController {

  fileprivate func registerCells() {
    collectionView.register(ComplementaryCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(AnalogousCell.self, forCellWithReuseIdentifier: analogousId)
    collectionView.register(TriadicCell.self, forCellWithReuseIdentifier: triadicId)
    collectionView.register(TetradicCell.self, forCellWithReuseIdentifier: tetradicId)
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    switch indexPath.item {
    case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: analogousId, for: indexPath) as? AnalogousCell else { return UICollectionViewCell() }

            if let analo = color {
              cell.updatedAnalogous = AnalogousHarmony(currentColorBackground: analo,
                                                       hexLabel: analo.toHexString(),
                                                       hexLabelColor: analo.isLight(),
                                                       analogousColor: analo.analagous,
                                                       analogousLabel: analo.analagous.toHexString(),
                                                       analogousLabelColor: analo.analagous.isLight(),
                                                       analogousColor2: analo.analagous1,
                                                       analogousLabel2: analo.analagous1.toHexString(),
                                                       analogousLabelColor2: analo.analagous1.isLight())
            }
            return cell

    case 2:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: triadicId, for: indexPath) as? TriadicCell else { return UICollectionViewCell() }

            if let tri = color {
              cell.updatedTriadic = TradicHarmony(currentColorBackground: tri,
                                                  hexLabel: tri.toHexString(),
                                                  hexLabelColor: tri.isLight(),
                                                  tridadicColor: tri.triadic0,
                                                  tridadicLabel: tri.triadic0.toHexString(),
                                                  tridadicLabelColor: tri.triadic0.isLight(),
                                                  tridadicColor2: tri.triadic1,
                                                  tridadicLabel2: tri.triadic1.toHexString(),
                                                  tridadicLabelColor2: tri.triadic1.isLight())
            }
            return cell

    case 3:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tetradicId, for: indexPath) as? TetradicCell else { return UICollectionViewCell() }

            if let tet = color {
              cell.updatedTetradic = TetradicHarmony(currentColorBackground: tet,
                                                     hexLabel: tet.toHexString(),
                                                     hexLabelColor: tet.isLight(),
                                                     tetradicColor: tet.tetradic0,
                                                     tetradicLabel: tet.tetradic0.toHexString(),
                                                     tetradicLabelColor: tet.tetradic0.isLight(),
                                                     tetradicColor2: tet.tetradic1,
                                                     tetradicLabel2: tet.tetradic1.toHexString(),
                                                     tetradicLabelColor2: tet.tetradic1.isLight(),
                                                     tetradicColor3: tet.tetradic2,
                                                     tetradicLabel3: tet.tetradic2.toHexString(),
                                                     tetradicLabelColor3: tet.tetradic2.isLight())
            }
            return cell

    default:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? ComplementaryCell else { return UICollectionViewCell() }

      if let color = color {
        cell.updateComplementaryColors = ColorHarmony(mainColorBackground: color,
                                                      complementaryColor: color.complemented,
                                                      hexLabel: color.toHexString(),
                                                      hexLabelColor: color.isLight(),
                                                      complementaryHexLabel: color.complemented.toHexString(),
                                                      complementaryHexLabelColor: color.complemented.isLight())
      }
      return cell

    }

  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: view.frame.height)
  }

}
