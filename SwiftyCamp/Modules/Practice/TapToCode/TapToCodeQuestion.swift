//
//  TapToCodeQuestion.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

/// One Tap to Code practice question, loaded from JSON.
struct TapToCodeQuestion: Decodable {
    let question: String
    let existingCode: String
    let components: [String]
}
