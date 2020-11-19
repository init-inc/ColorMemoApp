//
//  MemoDetailViewController.swift
//  ColorMemoApp
//
//  Created by Taku Yamada on 2020/11/18.
//

import UIKit

class MemoDetailViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    var text: String?
    var recordDate: Date?
    
    var dateFormat: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd hh:mm"
        return dateFormatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
        setDoneButton()
    }
    
    func configure(text: String, recordDate: Date) {
        self.text = text
        self.recordDate = recordDate
    }
    
    func displayData() {
        textView.text = text
        if let recordDate = recordDate {
            navigationItem.title = dateFormat.string(from: recordDate)
        }
    }
    
    func setDoneButton() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        toolBar.barStyle = UIBarStyle.default
        toolBar.sizeToFit()
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let commitButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tapDoneButton))
        toolBar.items = [spacer, commitButton]
        textView.inputAccessoryView = toolBar
    }
    
    @objc func tapDoneButton() {
        view.endEditing(true)
    }
}
