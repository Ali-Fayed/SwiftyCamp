//
//  Chapter.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//
import UIKit

/// One chapter of Swift in Sixty Seconds.
struct Chapter: Decodable {
    var name: String
    var sections: [String]

    lazy var bundleNameSections: [String] = {
        sections.map { $0.bundleName }
    }()
}
