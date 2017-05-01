//
//  TabBarController.swift
//  CapstoneProject
//
//  Created by Jairo Eli de Leon on 10/7/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TabBarController: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  // MARK: - Properties
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = .clear
    cv.dataSource = self
    cv.delegate = self
    return cv
  }()
  
  let cellId = "cellId"
  let imageNames = ["Complementary", "Analogous", "Triadic", "Tetradic"]
  
  var colorHarmoniesController: ColorHarmoniesController?
  
  // MARK: - Setup
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    collectionView.register(TabBarCell.self, forCellWithReuseIdentifier: cellId)
    
    addSubview(collectionView)
    addConstraints(withFormat: "H:|[v0]|", views: collectionView)
    addConstraints(withFormat: "V:|[v0]|", views: collectionView)
    
    let selectedIndexPath = IndexPath(item: 0, section: 0)
    collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: UICollectionViewScrollPosition())
    
    setupHorizontalBar()
  
  }
  
  var horizontalLeftAnchorConstraint: NSLayoutConstraint?
  
  func setupHorizontalBar() {
    let horizontalBarView = UIView()
    horizontalBarView.backgroundColor = Eden.Independence.color
    horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(horizontalBarView)
    
    horizontalLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
    horizontalLeftAnchorConstraint?.isActive = true
    
    horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
    horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
  }
  
  // MARK: - Collection View Selected
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    colorHarmoniesController?.scrollToMenuIndex(indexPath.item)
  }
  
  // MARK: - CollectionView Data
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? TabBarCell else { return UICollectionViewCell() }
    
    cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
    cell.tintColor = Eden.Gray.color
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: frame.width / 4, height: frame.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

class TabBarCell: UICollectionViewCell {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - UI Elements
  
  let imageView = UIImageView {
    $0.image = #imageLiteral(resourceName: "home").withRenderingMode(.alwaysTemplate)
    $0.contentMode = .scaleAspectFit
    $0.tintColor = UIColor(hex: 0xCECECE)
  }
  
  override var isHighlighted: Bool {
    didSet {
      imageView.tintColor = isHighlighted ? Eden.Independence.color : UIColor(hex: 0xCECECE)
    }
  }
  
  override var isSelected: Bool {
    didSet {
      imageView.tintColor = isSelected ? Eden.Independence.color : UIColor(hex: 0xCECECE)
    }
  }
  
  func setupView() {
    addSubview(imageView)
    
    addConstraints(withFormat: "H:[v0(24)]", views: imageView)
    addConstraints(withFormat: "V:[v0(24)]", views: imageView)
    
    addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
    addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
  }
  
}
