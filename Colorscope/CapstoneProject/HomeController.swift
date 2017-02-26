//
//  HomeController.swift
//  CapstoneProject
//
//  Created by Jairo Eli de Leon on 10/5/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {
  
  // MARK: - Properties
  var color: DynamicColor?
  var tintColors: [Tint] = []
  fileprivate let cellId = "cellId"
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = .white
    cv.dataSource = self
    cv.delegate = self
    return cv
  }()
  
  let tabBarView = UIView {
    $0.backgroundColor = .clear
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor(white: 0.95, alpha: 1).cgColor
  }
  
  lazy var generateButton: UIButton = {
    let button = UIButton(type: .system)
    button.backgroundColor = .white
    button.setTitle("GENERATE", for: .normal)
    button.titleLabel?.font = FontBook.Medium.of(size: 22)
    button.setTitleColor(Eden.Independence.color, for: .normal)
    button.addTarget(self, action: #selector(handleGenerate), for: .touchUpInside)
    return button
  }()
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(collectionView)
    navigationSwipe()
    setupCollectionView()
    setupTabBar()
    handleGenerate()
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  fileprivate func setupCollectionView() {
    collectionView.register(TintCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    collectionView.alwaysBounceVertical = false
  }
  
  fileprivate func setupTabBar() {
    view.addSubview(tabBarView)
    view.addSubview(generateButton)
    
    _ = tabBarView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 62)
    tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
    _ = generateButton.anchor(top: tabBarView.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 58)
    
  }
  
  // MARK: - Navigation
  
  func navigationSwipe() {
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
    
    self.navigationController?.isNavigationBarHidden = true
    navigationController?.interactivePopGestureRecognizer?.delegate = self
    
    let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(popViewController))
    swipeRight.direction = UISwipeGestureRecognizerDirection.right
    self.view.addGestureRecognizer(swipeRight)
  }
  
  func popViewController(gesture: UIGestureRecognizer) {
    if let swipeGesture = gesture as? UISwipeGestureRecognizer {
      switch swipeGesture.direction {
      case UISwipeGestureRecognizerDirection.right:
        _ = self.navigationController?.popViewController(animated: true)
      default:
        break
      }
    }
  }
  
  // MARK: - SignOut
  
  func handleSignOut() {
    UserDefaults.standard.setIsLoggedIn(value: false)
    
    let loginController = WalkthroughController()
    present(loginController, animated: true, completion: nil)
  }
  
  // MARK: Handle Actions
  
  func handleUndo() {
    //show
    
  }
  
  func handleGenerate() {
    let random = randomColor(hue: .random, luminosity: .random)
    
    let currentColor = Tint(hexLabel: random.toHexString(),
                            hexLabelColor: random.isLight(),
                            currentColor: random)
    
    let tint = Tint(hexLabel: currentColor.currentColor.tinted(amount: 0.2).toHexString(),
                    hexLabelColor: currentColor.currentColor.tinted(amount: 0.2).isLight(),
                    currentColor: currentColor.currentColor.tinted(amount: 0.2))
    
    let tint2 = Tint(hexLabel: currentColor.currentColor.tinted(amount: 0.4).toHexString(),
                     hexLabelColor: currentColor.currentColor.tinted(amount: 0.4).isLight(),
                     currentColor: currentColor.currentColor.tinted(amount: 0.4))
    
    let tint3 = Tint(hexLabel: currentColor.currentColor.tinted(amount: 0.6).toHexString(),
                     hexLabelColor: currentColor.currentColor.tinted(amount: 0.6).isLight(),
                     currentColor: currentColor.currentColor.tinted(amount: 0.6))
    
    let shade1 = Tint(hexLabel: currentColor.currentColor.shaded(amount: 0.2).toHexString(),
                      hexLabelColor: currentColor.currentColor.shaded(amount: 0.2).isLight(),
                      currentColor: currentColor.currentColor.shaded(amount: 0.2))
    
    let shade2 = Tint(hexLabel: currentColor.currentColor.shaded(amount: 0.4).toHexString(),
                      hexLabelColor: currentColor.currentColor.shaded(amount: 0.4).isLight(),
                      currentColor: currentColor.currentColor.shaded(amount: 0.4))
    
    let shade3 = Tint(hexLabel: currentColor.currentColor.shaded(amount: 0.6).toHexString(),
                      hexLabelColor: currentColor.currentColor.shaded(amount: 0.6).isLight(),
                      currentColor: currentColor.currentColor.shaded(amount: 0.6))
    
    let tintArray = [tint3, tint2, tint, currentColor, shade1, shade2, shade3]
    
    tintColors = tintArray
    collectionView.reloadData()
  }
  
  // MARK: - Selected Cell
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let controller = ColorHarmoniesController()
    
    let color  = tintColors[indexPath.item]
    
    navigationController?.pushViewController(controller, animated: true)
    
    controller.color = color.currentColor
  }
  
  // MARK: - Collection View Data Source
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return tintColors.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? TintCell else { return UICollectionViewCell() }
    
    let tint = tintColors[indexPath.item]
    cell.backgroundColor = tint.currentColor
    cell.numberLabel.text = tint.hexLabel
    cell.numberLabel.textColor = tint.hexLabelColor
  
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: (view.frame.height - 58) / 7)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
}
