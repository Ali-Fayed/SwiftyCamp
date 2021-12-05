//
//  PredictTheOutputAnswer.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

/// A single Predict the Output answer loaded from JSON.
struct PredictTheOutputAnswer: Decodable {
    var conditions: [Condition]?
    var text: String
}
