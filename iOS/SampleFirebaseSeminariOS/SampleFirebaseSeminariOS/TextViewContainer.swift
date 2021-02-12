//
//  TextViewContainer.swift
//  SampleFirebaseSeminariOS
//
//  Created by Fumiya Tanaka on 2021/02/13.
//

import Foundation
import UIKit

class TextViewContainer: UIView {
    
    @IBOutlet weak var textView: UITextView!
    
    override var intrinsicContentSize: CGSize {
        return textView.intrinsicContentSize
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let toolBar = UIToolbar()
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(close))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.items = [space, closeButton]
        toolBar.sizeToFit()
        textView.inputAccessoryView = toolBar
    }
    
    @objc
    func close() {
        textView.resignFirstResponder()
    }
}
