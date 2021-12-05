//
//  AlertHandling.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import SwiftEntryKit
import UIKit

/// Declares that a conforming type is able to handle alerts being dismissed.
protocol AlertHandling {
    func alertDismissed(type: AlertType)
}
