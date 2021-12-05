//
//  SplitViewControllerDelegate.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

class SplitViewControllerDelegate: UISplitViewControllerDelegate {
    static let shared = SplitViewControllerDelegate()

    private init() { }

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if secondaryViewController is PleaseSelectViewController {
            return true
        } else {
            return false
        }
    }
}
