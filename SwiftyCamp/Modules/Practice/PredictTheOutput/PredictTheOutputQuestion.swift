//
//  PredictTheOutputQuestion.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import Foundation

/// One Predict the Output practice question, loaded from JSON.
struct PredictTheOutputQuestion: Decodable {
    let code: String
    let answers: [PredictTheOutputAnswer]
}
