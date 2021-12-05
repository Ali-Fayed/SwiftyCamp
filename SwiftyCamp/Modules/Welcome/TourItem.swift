//
//  TourItem.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

/// Stores a single page of the app tour loaded from JSON.
struct TourItem: Decodable {
    let image: String
    let title: String
    let text: String
}
