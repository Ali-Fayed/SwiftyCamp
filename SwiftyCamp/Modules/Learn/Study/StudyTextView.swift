//
//  StudyTextView.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

/// A trivial text view subclass that loads Swift in Sixty Seconds chapters.
class StudyTextView: TappableTextView {
    func loadContent(_ contentName: String) {
        // load our chapter text
        attributedText = NSAttributedString(chapterName: contentName, width: bounds.width)

        if #available(iOS 13, *) {
            backgroundColor = .systemBackground
        } else {
            backgroundColor = .white
        }

        isEditable = false
    }
}
