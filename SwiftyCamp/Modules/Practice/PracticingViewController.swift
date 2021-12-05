//
//  PracticingViewController.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

/// Each of our practice view controllers must have a coordinator, a question number (so we know its position in the sequence), and a practice type so that we can track how many times it has been used.
protocol PracticingViewController: UIViewController, Sequenced {
    var coordinator: (Skippable & AnswerHandling)? { get set }
    var questionNumber: Int { get set }
    var practiceType: String { get }
}
