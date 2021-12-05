//
//  SpotTheErrorQuestion.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

/// One Spot the Error practice question, loaded from JSON.
struct SpotTheErrorQuestion: Decodable {
    /// The filename we want to load from.
    let file: String

    /// An array of replacements we can should apply to make the code more random.
    let replacements: [Replacement]

    /// The lowest and highest values we can use while generating numbers.
    let inputMinimum: Int
    let inputMaximum: Int
}
