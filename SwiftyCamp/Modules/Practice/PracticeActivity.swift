//
//  PracticeActivity.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

/// Describes what each practice activity needs to provide so that we can list it on the practice screen and instantiate it.
protocol PracticeActivity {
    static var name: String { get }
    static var subtitle: String { get }
    static var lockedUntil: String { get }
    static var isLocked: Bool { get }
    static var icon: UIImage { get }

    static func instantiate() -> UIViewController & PracticingViewController
}

extension PracticeActivity {
    /// Every activity knows when it should be unlocked, so we can calculate what is locked based on the user's rating.
    static var isLocked: Bool {
        let scoreForActivity = User.current.ratingForSection(lockedUntil.bundleName)
        return scoreForActivity == 0
    }
}
