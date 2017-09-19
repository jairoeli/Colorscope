//
//  MainNavigationController.swift
//  CapstoneProject
//
//  Created by Jairo Eli de Leon on 10/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    if isLoggedIn() {
      // assumes user is logged in
      let homeController = HomeController()
      viewControllers = [homeController]
    } else {
      perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
    }

  }

  // MARK: Login in
  fileprivate func isLoggedIn() -> Bool {
    return UserDefaults.standard.isLoggedIn()
  }

  @objc func showLoginController() {
    let loginController = WalkthroughController()

    present(loginController, animated: true, completion: {
      // perhaps we'll do something later
    })
  }

}
