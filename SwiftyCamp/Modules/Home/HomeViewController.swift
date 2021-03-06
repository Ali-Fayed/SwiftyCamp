//
//  HomeViewController.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import StoreKit
import UIKit

/// The main view controller you see in  the Home tab in the app.
class HomeViewController: UITableViewController, Storyboarded, UserTracking {
    var coordinator: HomeCoordinator?
    var dataSource = HomeDataSource()
    var reviewRequested = false

    override func viewDidLoad() {
        super.viewDidLoad()
        assert(coordinator != nil, "You must set a coordinator before presenting this view controller.")
        title = "Home"
        registerForUserChanges()
        tableView.dataSource = dataSource
    }

    /// When running on a real device for a user that has been using the app for a while, this prompts for a review.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        #if DEBUG
            // showing the review request thing while debugging is annoying, so we'll just do nothing instead
        #else
            // once the user has had some time with the app, ask them what they think
            if reviewRequested == false && User.current.totalPoints > 2000 {
                SKStoreReviewController.requestReview()
                reviewRequested = true
            }
        #endif
    }

    /// Calculate the height for table section headers; the first section shouldn't have a title.
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            // Using 0 for a section height doesn't work, so this value is effectively 0.
            return CGFloat.leastNonzeroMagnitude
        } else {
            return UITableView.automaticDimension
        }
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
    }

    /// When the Share Score cell is tapped start the share score process, otherwise do nothing.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    /// Refreshes everything when the user changes.
    func userDataChanged() {
        tableView.reloadData()
    }
}
