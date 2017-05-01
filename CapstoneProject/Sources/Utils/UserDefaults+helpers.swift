//
//  UserDefaults+helpers.swift
//  CapstoneProject
//
//  Created by Jairo Eli de Leon on 10/5/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

extension UserDefaults {

  enum UserDefaultsKeys: String {
    case IsLoggedIn
  }

  // Setter
  func setIsLoggedIn(value: Bool) {
    set(value, forKey: UserDefaultsKeys.IsLoggedIn.rawValue)
    synchronize()
  }

  // Getter
  func isLoggedIn() -> Bool {
    return bool(forKey: UserDefaultsKeys.IsLoggedIn.rawValue)
  }

}
