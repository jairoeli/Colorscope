//
//  TutorialController.swift
//  ColorHarmonies
//
//  Created by Jairo Eli de Leon on 10/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TutorialController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  // MARK: - Property

  fileprivate let cellId = "cellId"

  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = .white
    cv.delegate = self
    cv.dataSource = self
    cv.isPagingEnabled = true
    return cv
  }()

  lazy var cancelBackground: UIButton = {
    let button = UIButton(type: .system)
    button.backgroundColor = .clear
    button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
    return button
  }()

  let dismissButton = UIButton(type: .system) {
    $0.setImage(#imageLiteral(resourceName: "dismiss"), for: .normal)
    $0.tintColor = Eden.Independence.color
  }

  @objc func handleDismiss() {
    dismiss(animated: true, completion: nil)
  }

  var pages: [WalkthroughPage] = {
    let firstPage = WalkthroughPage(title: "COMPLEMENTARY", message: "Uses colors that are opposite each other on the color wheel.", imageName: "complementary")

    let secondPage = WalkthroughPage(title: "ANALOGOUS", message: "Uses colors that are next to each other on the color wheel.", imageName: "analogous")

    let thirdPage = WalkthroughPage(title: "TRIADIC", message: "Uses colors that are evenly spaced around the color wheel.", imageName: "triadic")

    let fourthPage = WalkthroughPage(title: "TETRADIC", message: "Uses four colors arranged into two complementary pairs.", imageName: "tetraidc")

    return [firstPage, secondPage, thirdPage, fourthPage]
  }()

  var pageControlBottomAnchor: NSLayoutConstraint?

  lazy var pageControl: UIPageControl = {
    let pc = UIPageControl()
    pc.pageIndicatorTintColor = Eden.Independence.color.tinted(amount: 0.6)
    pc.currentPageIndicatorTintColor = Eden.Independence.color
    pc.numberOfPages = self.pages.count
    return pc
  }()

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.showsHorizontalScrollIndicator = false

    view.addSubview(collectionView)
    view.addSubview(pageControl)
    view.addSubview(dismissButton)
    view.addSubview(cancelBackground)

    if #available(iOS 11.0, *) {
      pageControlBottomAnchor = pageControl.anchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)[1]
    } else {
      pageControlBottomAnchor = pageControl.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)[1]
    }

    if #available(iOS 11.0, *) {
      _ = cancelBackground.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 70)
    } else {
      _ = cancelBackground.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 70)
    }

    if #available(iOS 11.0, *) {
      _ = dismissButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 28, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 12, heightConstant: 12)
    } else {
      _ = dismissButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 28, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 12, heightConstant: 12)
    }

    // use auto layout
    collectionView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    registerCells()
  }

  override var prefersStatusBarHidden: Bool {
    return true
  }

  fileprivate func registerCells() {
    collectionView.register(WalkthroughPageCell.self, forCellWithReuseIdentifier: cellId)
  }

  // MARK: - Actions

  func nextPage() {
    // we are on the last page
    if pageControl.currentPage == pages.count {
      return
    }

    // second last page
    if pageControl.currentPage == pages.count - 1 {
      moveControlConstraintsOffScreen()

      spring(duration: 0.5) {
        self.view.layoutIfNeeded()
      }
    }

    let indexPath = IndexPath(item: pageControl.currentPage + 1, section: 0)
    collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    pageControl.currentPage += 1
  }

  func skip() {
    pageControl.currentPage = pages.count - 1
    nextPage()
  }

  // MARK: - Refactor code

  fileprivate func moveControlConstraintsOffScreen() {
    pageControlBottomAnchor?.constant = 40
  }

  // MARK: - Scroll

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    view.endEditing(true)
  }

  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

    let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
    pageControl.currentPage = pageNumber

    // we are on the last page
    if pageNumber == pages.count {
      moveControlConstraintsOffScreen()
    } else {
      // back on regular pages
      pageControlBottomAnchor?.constant = 0
    }

    spring(duration: 0.5) {
      self.view.layoutIfNeeded()
    }

  }

  // MARK: - Collection view data source

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pages.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? WalkthroughPageCell else { return UICollectionViewCell() }

    let page = pages[indexPath.item]
    cell.tutorialPage = page

    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: view.frame.height)
  }

}
