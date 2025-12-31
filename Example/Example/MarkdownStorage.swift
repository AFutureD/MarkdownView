//
//  MarkdownStorage.swift
//  Example
//
//  Created by Huanan on 2025/12/31.
//

import UIKit


class MarkdownStorage: NSTextStorage {
    override func edited(_ editedMask: NSTextStorage.EditActions, range editedRange: NSRange, changeInLength delta: Int) {
        super.edited(editedMask, range: editedRange, changeInLength: delta)
    }
}
