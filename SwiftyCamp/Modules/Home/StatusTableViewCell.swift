//
//  StatusTableViewCell.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

class StatusTableViewCell: UITableViewCell {
    @IBOutlet var statusView: StatusView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // By setting accessibility element to false, we allow voiceover to access the elements inside
        isAccessibilityElement = false
    }
}
