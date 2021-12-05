//
//  RearrangeLinesQuestion.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import Foundation

/// One Rearrange the Lines practice question, loaded from JSON.
struct RearrangeTheLinesQuestion: Decodable {
    let question: String
    let hint: String
    let code: String
}
