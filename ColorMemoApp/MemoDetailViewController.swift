//
//  MemoDetailViewController.swift
//  ColorMemoApp
//
//  Created by Taku Yamada on 2020/11/18.
//

import UIKit
import RealmSwift

class MemoDetailViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var textView: UITextView!
    
    var memo = MemoData()
    
    var dateFormat: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd hh:mm"
        return dateFormatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
        setDoneButton()
        
        textView.delegate = self
    }
    
    func configure(memo: MemoData) {
        self.memo = memo
    }
    
    func displayData() {
        textView.text = memo.text
        navigationItem.title = dateFormat.string(from: memo.recordDate)
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
    
    func saveData() {
        let realm = try! Realm()
        try! realm.write {
            realm.add(memo)
        }
    }
    
    // MARK: - UITextViewDelegate
    func textViewDidChange(_ textView: UITextView) {
        memo.text = textView.text
        memo.recordDate = Date()
        saveData()
    }
}
