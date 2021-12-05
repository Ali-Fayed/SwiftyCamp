//
//  HomeDataSource.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

/// Manages all the rows in the Home table view. This is a fairly grim class and really ought to be refactored.
class HomeDataSource: NSObject, UITableViewDataSource {
    // We have five sections: the status view, points, stats and streak
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    // All sections have a title except the first one.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil

        case 1:
            return "POINTS"

        case 2:
            return "STATS"

        default:
            fatalError("Unknown table view section: \(section).")
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            // status view
            return 2

        case 1:
            // score breakdown
            return 3
            
        case 2:
            // level stats
            return 2

        default:
            fatalError("Unknown table view section: \(section).")
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                return makeStatus(in: tableView, indexPath: indexPath)
            } else {
                return makePointsSummary(in: tableView, indexPath: indexPath)
            }

        case 1:
            return makePointsBreakdown(in: tableView, indexPath: indexPath)

        case 2:
            return makeStatistic(in: tableView, indexPath: indexPath)

        default:
            fatalError("Unknown index path: \(indexPath).")
        }
    }

    /// Shows the activity ring and current rank.
    func makeStatus(in tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Rank", for: indexPath) as? StatusTableViewCell else {
            fatalError("Failed to dequeue a StatusTableViewCell.")
        }
        cell.statusView.shadowOpacity = 0
        cell.statusView.strokeColorStart = UIColor(bundleName: "Rank-Start")
        cell.statusView.strokeColorEnd = UIColor(bundleName: "Rank-End")
        return cell
    }
    /// Shows the user's total points in large text.
    func makePointsSummary(in tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Points", for: indexPath)
        cell.textLabel?.attributedText = NSAttributedString.makeTitle("Points", subtitle: User.current.totalPoints.formatted)
        cell.accessibilityLabel = "\(User.current.totalPoints) points"

        return cell
    }

    /// Shows the user's points breakdown.
    func makePointsBreakdown(in tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueStatReusableCell(in: tableView, indexPath: indexPath)

        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Learning Points"
            cell.detailTextLabel?.text = User.current.learnPoints.formatted
            cell.accessibilityLabel = "\(User.current.learnPoints) points from learning"

        case 1:
            cell.textLabel?.text = "Review Points"
            cell.detailTextLabel?.text = User.current.reviewPoints.formatted
            cell.accessibilityLabel = "\(User.current.reviewPoints) points from reviews"

        case 2:
            cell.textLabel?.text = "Practice Points"
            cell.detailTextLabel?.text = User.current.practicePoints.formatted
            cell.accessibilityLabel = "\(User.current.practicePoints) points from practicing"

        default:
            fatalError("Unknown index path: \(indexPath).")
        }

        return cell
    }

    /// Shows how the user is progressing through levels.
    func makeStatistic(in tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueStatReusableCell(in: tableView, indexPath: indexPath)

        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Current Level"
            cell.detailTextLabel?.text = "\(User.current.rankNumber)/21"
            cell.accessibilityLabel = "You are level \(User.current.rankNumber) of 21."

        case 1:
            cell.textLabel?.text = "Points Until Next Level"

            if let points = User.current.pointsUntilNextRank {
                cell.detailTextLabel?.text = String(points)
                cell.accessibilityLabel = "You need \(points) more points to reach the next level."
            } else {
                cell.detailTextLabel?.text = "N/A"
                cell.accessibilityLabel = "You are at the maximum level."
            }

        default:
            fatalError("Unknown index path: \(indexPath).")
        }

        return cell
    }

    /// Dequeue a reusable and clean table view cell to show an stat.
    func dequeueStatReusableCell(in tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Stat", for: indexPath)
        cell.textLabel?.textColor = nil
        cell.detailTextLabel?.text = nil
        cell.accessibilityLabel = nil
        cell.accessibilityTraits = .none
        return cell
    }
}
