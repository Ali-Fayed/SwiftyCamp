//
//  ReviewSingleSelectViewController.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

class ReviewSingleSelectViewController: SingleSelectReviewViewController {
    @objc override func skip() {
        coordinator?.skipPracticing()
    }
}
