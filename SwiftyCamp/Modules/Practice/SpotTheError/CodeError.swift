//
//  CodeError.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

/// Stores complete data about one code error.
struct CodeError {
    var code: String
    var error: CodeErrorType
    var lineNumber: Int
}
