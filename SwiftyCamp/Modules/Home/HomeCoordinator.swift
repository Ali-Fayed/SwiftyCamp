//
//  HomeCoordinator.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

/// Manages everything launched from the Home tab in the app.
class HomeCoordinator: Coordinator, AlertShowing {
    var splitViewController = UISplitViewController()
    var navigationController: CoordinatedNavigationController

    private static let firstRunDefaultsKey = "ShownFirstRun"

    /// True when this is the first time the app has been launched.
    var isFirstRun: Bool {
        return UserDefaults.standard.bool(forKey: HomeCoordinator.firstRunDefaultsKey) == false
    }

    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController()) {
        self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.coordinator = self
        let viewController = HomeViewController.instantiate()
        viewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(bundleName: "Home"), tag: 0)
        viewController.coordinator = self
        navigationController.viewControllers = [viewController]

        if isFirstRun {
            /// If this is the first time the app is running, wait a tiny fraction of time before showing the welcome screen.
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                // Put the contents of showTour in here directly avoid trying to capture `self` during an initializer.
                let viewController = WelcomeViewController.instantiate()
                viewController.presentAsAlert()
                // Mark that we've run the app at least once.
                UserDefaults.standard.set(true, forKey: HomeCoordinator.firstRunDefaultsKey)
            }
        }
    }
    /// Show the welcome screen with a short app introduction.
    func showTour() {
        let viewController = WelcomeViewController.instantiate()
        viewController.presentAsAlert()
    }
}
