//
//  PopupDialogDefaultViewController.swift
//  CapstoneProject
//
//  Created by Jairo Eli de Leon on 11/2/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

final public class PopupDialogDefaultViewController: UIViewController {

    public var standardView: PopupDialogDefaultView {
       return view as! PopupDialogDefaultView
    }

    override public func loadView() {
        super.loadView()
        view = PopupDialogDefaultView(frame: .zero)
    }
}

public extension PopupDialogDefaultViewController {

    // MARK: - Setter / Getter

    // MARK: Content

    /// The dialog image
    public var image: UIImage? {
        get { return standardView.imageView.image }
        set {
            standardView.imageView.image = newValue
            standardView.imageView.isHidden = newValue != nil ? false : true
            standardView.pv_layoutIfNeededAnimated()
        }
    }

    /// The title text of the dialog
    public var titleText: String? {
        get { return standardView.titleLabel.text }
        set {
            standardView.titleLabel.text = newValue
            //standardView.titleLabel.hidden = newValue != nil ? false : true
            standardView.pv_layoutIfNeededAnimated()
        }
    }

    /// The message text of the dialog
    public var messageText: String? {
        get { return standardView.messageLabel.text }
        set {
            standardView.messageLabel.text = newValue
            //standardView.messageLabel.hidden = newValue != nil ? false : true
            standardView.pv_layoutIfNeededAnimated()
        }
    }

    // MARK: Appearance

    /// The font and size of the title label
    public dynamic var titleFont: UIFont {
        get { return standardView.titleFont }
        set {
            standardView.titleFont = newValue
            standardView.pv_layoutIfNeededAnimated()
        }
    }

    /// The color of the title label
    public dynamic var titleColor: UIColor? {
        get { return standardView.titleLabel.textColor }
        set {
            standardView.titleColor = newValue
            standardView.pv_layoutIfNeededAnimated()
        }
    }

    /// The text alignment of the title label
    public dynamic var titleTextAlignment: NSTextAlignment {
        get { return standardView.titleTextAlignment }
        set {
            standardView.titleTextAlignment = newValue
            standardView.pv_layoutIfNeededAnimated()
        }
    }

    /// The font and size of the body label
    public dynamic var messageFont: UIFont {
        get { return standardView.messageFont}
        set {
            standardView.messageFont = newValue
            standardView.pv_layoutIfNeededAnimated()
        }
    }

    /// The color of the message label
    public dynamic var messageColor: UIColor? {
        get { return standardView.messageColor }
        set {
            standardView.messageColor = newValue
            standardView.pv_layoutIfNeededAnimated()
        }
    }

    /// The text alignment of the message label
    public dynamic var messageTextAlignment: NSTextAlignment {
        get { return standardView.messageTextAlignment }
        set {
            standardView.messageTextAlignment = newValue
            standardView.pv_layoutIfNeededAnimated()
        }
    }
}
