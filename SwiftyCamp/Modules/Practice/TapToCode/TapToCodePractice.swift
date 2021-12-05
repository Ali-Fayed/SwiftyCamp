//
//  TapToCodePractice.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

/// The Tap to Code practice activity. Shows users some code that has been split into chunks and shuffled, and they need to tap and drag those chunks back to the correct order.
class TapToCodePractice: PracticeActivity {
    // The user-facing question explaining what is needed.
    var question: String

    // An array of code components the user can rearrange.
    var components: [String]

    // Any code we should show before the user-replaceable code.
    var existingCode: String

    static let name = "Tap to Code"
    static let subtitle = "Build working code by tapping components"
    static let lockedUntil = "Infinite Loops"
    static let icon = UIImage(bundleName: "Practice-TapToCode")

    init() {
        let items = Bundle.main.decode([TapToCodeQuestion].self, from: "TapToCode.json")
        let selectedItem = items[SwiftyCamp.getEntropy() % items.count]

        (question, components, existingCode) = (selectedItem.question, selectedItem.components, selectedItem.existingCode)
    }

    /// Creates a view controller configured with a Tap to Code practice.
    static func instantiate() -> UIViewController & PracticingViewController {
        let viewController = TapToCodeViewController.instantiate()
        viewController.practiceData = TapToCodePractice()
        return viewController
    }
}
