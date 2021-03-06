//
//  LearnViewController.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

/// The main view controller you see in  the Home tab in the app.
class LearnViewController: UITableViewController, UserTracking, UIViewControllerPreviewingDelegate {
    var coordinator: LearnCoordinator?

    /// This handles all the rows in our table view.
    let dataSource = LearnDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        assert(coordinator != nil, "You must set a coordinator before presenting this view controller.")

        title = "Learn"
        registerForUserChanges()
        extendedLayoutIncludesOpaqueBars = true
        tableView = UITableView(frame: tableView.frame, style: .insetGrouped)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        registerForPreviewing(with: self, sourceView: tableView)
        dataSource.delegate = self

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(DynamicHeightHeaderView.self, forHeaderFooterViewReuseIdentifier: "SectionHeader")
    }

    /// Refreshes visible cells when the user changes.
    func userDataChanged() {
        guard let indexPaths = tableView.indexPathsForVisibleRows else { return }
        tableView.reloadRows(at: indexPaths, with: .none)
    }

    func startStudying(title: String) {
        coordinator?.startStudying(title: title)
    }

    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if let indexPath = tableView.indexPathForRow(at: location) {
            previewingContext.sourceRect = tableView.rectForRow(at: indexPath)
            let selectedChapter = dataSource.title(for: indexPath)
            return coordinator?.studyViewController(for: selectedChapter)
        }

        return nil
    }

    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        coordinator?.startStudying(using: viewControllerToCommit)
    }
}
