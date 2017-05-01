//
//  PopupDialogDefaultButtons.swift
//  CapstoneProject
//
//  Created by Jairo Eli de Leon on 11/2/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

// MARK: Default button

/// Represents the default button for the popup dialog
public final class DefaultButton: PopupDialogButton {}

// MARK: Cancel button

/// Represents a cancel button for the popup dialog
public final class CancelButton: PopupDialogButton {

    override public func setupView() {
        defaultTitleColor = Eden.Independence.color
        super.setupView()
    }
}

// MARK: destructive button

/// Represents a destructive button for the popup dialog
public final class DestructiveButton: PopupDialogButton {

    override public func setupView() {
        defaultTitleColor = UIColor.red
        super.setupView()
    }
}
