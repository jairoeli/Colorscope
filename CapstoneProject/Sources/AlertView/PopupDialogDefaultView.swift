//
//  PopupDialogView.swift
//  CapstoneProject
//
//  Created by Jairo Eli de Leon on 11/2/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

/// The main view of the popup dialog
final public class PopupDialogDefaultView: UIView {

    // MARK: - Appearance

    /// The font and size of the title label
    @objc public dynamic var titleFont: UIFont {
        get { return titleLabel.font }
        set { titleLabel.font = newValue }
    }

    /// The color of the title label
    @objc public dynamic var titleColor: UIColor? {
        get { return titleLabel.textColor }
        set { titleLabel.textColor = newValue }
    }

    /// The text alignment of the title label
    @objc public dynamic var titleTextAlignment: NSTextAlignment {
        get { return titleLabel.textAlignment }
        set { titleLabel.textAlignment = newValue }
    }

    /// The font and size of the body label
    @objc public dynamic var messageFont: UIFont {
        get { return messageLabel.font }
        set { messageLabel.font = newValue }
    }

    /// The color of the message label
    @objc public dynamic var messageColor: UIColor? {
        get { return messageLabel.textColor }
        set { messageLabel.textColor = newValue}
    }

    /// The text alignment of the message label
    @objc public dynamic var messageTextAlignment: NSTextAlignment {
        get { return messageLabel.textAlignment }
        set { messageLabel.textAlignment = newValue }
    }

    // MARK: - Views

    /// The view that will contain the image, if set
    internal lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    /// The title label of the dialog
    internal lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = Eden.Independence.color
        titleLabel.font = FontBook.Medium.of(size: 32)
        return titleLabel
    }()

    /// The message label of the dialog
    internal lazy var messageLabel: UILabel = {
        let messageLabel = UILabel(frame: .zero)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.textColor = Eden.Independence.color.tinted(amount: 0.6) // UIColor.lightGray
        messageLabel.font = FontBook.Medium.of(size: 26)
        return messageLabel
    }()

    // MARK: - Initializers

    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View setup

    internal func setupViews() {

        // Self setup
        translatesAutoresizingMaskIntoConstraints = false

        // Add views
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(messageLabel)

        // Layout views
        let views = ["imageView": imageView, "titleLabel": titleLabel, "messageLabel": messageLabel] as [String : Any]
        var constraints = [NSLayoutConstraint]()

        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageView]|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-(==20@900)-[titleLabel]-(==20@900)-|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-(==20@900)-[messageLabel]-(==20@900)-|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|[imageView]-(==30@900)-[titleLabel]-(==8@900)-[messageLabel]-(==30@900)-|", options: [], metrics: nil, views: views)

        // Activate constraints
        NSLayoutConstraint.activate(constraints)
    }
}
