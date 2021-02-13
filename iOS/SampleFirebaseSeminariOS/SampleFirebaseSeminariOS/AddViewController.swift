//
//  ViewController.swift
//  SampleFirebaseSeminariOS
//
//  Created by Fumiya Tanaka on 2021/02/12.
//

import UIKit
import FirebaseFirestore

class AddViewController: UIViewController {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var termTextField: UITextField!
    @IBOutlet weak var courseTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: UIApplication.keyboardWillShowNotification, object: nil, queue: nil) { notification in
            let height = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height ?? 0
            if !self.messageTextView.isFirstResponder {
                return
            }
            let globalFrame = self.messageTextView.convert(self.messageTextView.frame, to: self.view)
            let bottom = globalFrame.height + globalFrame.origin.y
            let keyboardTop = UIScreen.main.bounds.height - height
            let distance = bottom - keyboardTop
            if distance >= 0 {
                self.scrollView.contentOffset.y = distance + 50
            }
        }
        
        NotificationCenter.default.addObserver(forName: UIApplication.keyboardDidHideNotification, object: nil, queue: nil) { notification in
            self.scrollView.contentOffset.y = 0
        }
    }
    
    @IBAction func add() {
        let fullName = fullNameTextField.text!
        let nickName = nickNameTextField.text!
        let term = Int(termTextField.text!)!
        let course = courseTextField.text!
        let message = messageTextView.text!
        
        let data: [String: Any] = [
            "name": fullName,
            "nickname": nickName,
            "term": term,
            "course": course,
            "self_introduction": message
        ]
        
        Firestore.firestore().collection("users").document().setData(data) { (error) in
            if let error = error {
                self.showAlert(title: "エラー", message: "\(error)")
            } else {
                self.showAlert(title: "成功", message: "データを追加しました！")
            }
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "閉じる", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

