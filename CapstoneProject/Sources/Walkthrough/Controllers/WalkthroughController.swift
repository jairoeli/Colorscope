//
//  ViewController.swift
//  CapstoneProject
//
//  Created by Jairo Eli de Leon on 9/30/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

protocol LoginControllerDelegate: class {
  func finishLoggingIn()
}

class WalkthroughController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, LoginControllerDelegate {

  // MARK: Property
  fileprivate let cellId = "cellId"
  fileprivate let loginCellId = "loginCellId"
  fileprivate let harmonyCellId = "harmonyCellId"
  fileprivate let welcomeCellId = "welcomeCellId"
  fileprivate let selectedColorCellId = "selectedColorCellId"
  fileprivate let clipboardCellId = "clipboardCellId"

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

  var pageControlBottomAnchor: NSLayoutConstraint?
  var skipButtonTopAnchor: NSLayoutConstraint?
  var nextButtonTopAnchor: NSLayoutConstraint?

  // MARK: UI Elements

  lazy var pageControl: UIPageControl = {
    let pc = UIPageControl()
    pc.pageIndicatorTintColor = Eden.Independence.color.tinted(amount: 0.6)
    pc.currentPageIndicatorTintColor = Eden.Independence.color
    pc.numberOfPages = 6
    return pc
  }()

  lazy var skipButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("SKIP", for: .normal)
    button.titleLabel?.font = FontBook.Medium.of(size: 14)
    button.setTitleColor(Eden.Independence.color, for: .normal)
    button.addTarget(self, action: #selector(skip), for: .touchUpInside)
    return button
  }()

  lazy var nextButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("NEXT", for: .normal)
    button.titleLabel?.font = FontBook.Medium.of(size: 14)
    button.setTitleColor(Eden.Independence.color, for: .normal)
    button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
    return button
  }()

  // MARK: Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.showsHorizontalScrollIndicator = false

    view.addSubview(collectionView)
    view.addSubview(pageControl)
    view.addSubview(skipButton)
    view.addSubview(nextButton)

    pageControlBottomAnchor = pageControl.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)[1]

    skipButtonTopAnchor = skipButton.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 40).first

    nextButtonTopAnchor = nextButton.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 40).first

    // use auto layout
    collectionView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    registerCells()
  }

  fileprivate func registerCells() {
    collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(HarmonyCell.self, forCellWithReuseIdentifier: harmonyCellId)
    collectionView.register(GetStartedCell.self, forCellWithReuseIdentifier: loginCellId)
    collectionView.register(WelcomeCell.self, forCellWithReuseIdentifier: welcomeCellId)
    collectionView.register(SelectedColorCell.self, forCellWithReuseIdentifier: selectedColorCellId)
    collectionView.register(ClipboardCell.self, forCellWithReuseIdentifier: clipboardCellId)
  }

  override var prefersStatusBarHidden: Bool {
    return true
  }

  // MARK: Action

  @objc func nextPage() {
    // we are on the last page
    if pageControl.currentPage == 5 {
      return
    }

    // second last page
    if pageControl.currentPage == 5 - 1 {
      moveControlConstraintsOffScreen()

      spring(duration: 0.5) {
        self.view.layoutIfNeeded()
      }
    }

    let indexPath = IndexPath(item: pageControl.currentPage + 1, section: 0)
    collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    pageControl.currentPage += 1
  }

  @objc func skip() {
    pageControl.currentPage = 5 - 1
    nextPage()
  }

  // MARK: Refactor code

  fileprivate func moveControlConstraintsOffScreen() {
    pageControlBottomAnchor?.constant = 40
    skipButtonTopAnchor?.constant = 40
    nextButtonTopAnchor?.constant = 40
  }

  // MARK: Scroll

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    view.endEditing(true)
  }

  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

    let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
    pageControl.currentPage = pageNumber

    // we are on the last page
    if pageNumber == 5 {
      moveControlConstraintsOffScreen()
    } else {
      // back on regular pages
      pageControlBottomAnchor?.constant = 0
      skipButtonTopAnchor?.constant = 0
      nextButtonTopAnchor?.constant = 0
    }

    spring(duration: 0.5) {
      self.view.layoutIfNeeded()
    }

  }

  // MARK: Login
  func finishLoggingIn() {
    let rootViewController = UIApplication.shared.keyWindow?.rootViewController
    guard let mainNavigationController = rootViewController as? MainNavigationController else { return }
    mainNavigationController.viewControllers = [HomeController()]

    UserDefaults.standard.setIsLoggedIn(value: true)
    dismiss(animated: true, completion: nil)
  }

  // MARK: Collection view data source

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 6
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    switch indexPath.item {
    case 1:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? PageCell else { return UICollectionViewCell() }
      return cell

    case 2:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: selectedColorCellId, for: indexPath) as? SelectedColorCell else { return UICollectionViewCell() }
      return cell

    case 3:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: harmonyCellId, for: indexPath) as? HarmonyCell else { return UICollectionViewCell() }
      return cell

    case 4:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: clipboardCellId, for: indexPath) as? ClipboardCell else { return UICollectionViewCell() }
      return cell

    case 5:
      guard let loginCell = collectionView.dequeueReusableCell(withReuseIdentifier: loginCellId, for: indexPath) as? GetStartedCell else { return UICollectionViewCell() }
      loginCell.delegate = self
      return loginCell

    default:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: welcomeCellId, for: indexPath) as? WelcomeCell else { return UICollectionViewCell() }
      return cell
    }

  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: view.frame.height)
  }

}
