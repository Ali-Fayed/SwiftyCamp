//
//  AwardType.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

/// The four ways users can receive points: learning a chapter, reviewing a chapter, completing a practice activity, and completing a challenge.
enum AwardType {
    case learn(chapter: String)
    case review(chapter: String)
    case practice(type: String)
}
