//
//  WrongAnswer.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import Foundation

// A type that stores some answer text along with an explanation of why it's incorrect.
struct ReasonedAnswer: Decodable {
    var answer: String
    var reason: String
}
