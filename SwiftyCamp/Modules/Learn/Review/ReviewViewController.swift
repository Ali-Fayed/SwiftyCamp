//
//  ReviewViewController.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

class ReviewViewController: UIViewController, PracticingViewController {
    var coordinator: (AnswerHandling & Skippable)? {
        didSet {
            configureNavigation()
        }
    }

    var questionNumber = 1

    var practiceType = "review"

    var sectionName = ""
    var review: StudyReview!

    /// Run all our navigation bar code super early to avoid bad animations on iPhone
    func configureNavigation() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(skip))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hint", style: .plain, target: self, action: #selector(hint))
        extendedLayoutIncludesOpaqueBars = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        assert(coordinator != nil, "You must set a coordinator before presenting this view controller.")
    }

    @objc func hint() {
        showAlert(body: review.hint)
    }

    @objc func skip() {
        coordinator?.skipReviewing()
    }
}
