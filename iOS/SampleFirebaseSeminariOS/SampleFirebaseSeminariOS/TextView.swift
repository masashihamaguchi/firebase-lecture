//
//  TextView.swift
//  SampleFirebaseSeminariOS
//
//  Created by Fumiya Tanaka on 2021/02/13.
//

import Foundation
import UIKit

class TextView: UITextView {
    override func awakeFromNib() {
        super.awakeFromNib()
        let toolBar = UIToolbar()
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(close))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.items = [space, closeButton]
        toolBar.sizeToFit()
        inputAccessoryView = toolBar
    }
    
    @objc
    func close() {
        resignFirstResponder()
    }
}
