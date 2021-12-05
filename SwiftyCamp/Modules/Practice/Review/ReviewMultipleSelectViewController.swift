//
//  ReviewMultipleSelectViewController.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

class ReviewMultipleSelectViewController: MultipleSelectReviewViewController {
    @objc override func skip() {
        coordinator?.skipPracticing()
    }

    override func getTitle() -> String {
        return "Review" + (coordinator?.titleSuffix(for: self) ?? "")
    }
}
