//
//  CodeErrorType.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

/// An enum containing all possible error types we can create.
enum CodeErrorType: CaseIterable {
    case badResultType // result is declared as Int
    case badReturnType // returning Int/Double/Float
    case badValue // function is called using double/string/array of integers
    case badWhitespace // one instance of += has no whitespace either side

    case missingBrace
    case missingMinus // > String rather than -> String
    case missingParenthesis
    case missingQuote
    case missingReturnType // deleting -> String
    case missingReturnValue // ending function with just "return"

    case typoCaseCall // lowercasing name of function at call site
    case typoCaseReturn // Returning "string" rather than "String"
    case typoColon // one colon is a semicolon
    case typoFunction // "func" written as "function"
    case typoQuotes // Replace double quotes with single quotes
    case typoReturn // return -> "retrun"

    case anonymousParameters // first parameter has no external name
    case removingVar // changing "var result" to just "result"
}
