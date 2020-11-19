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
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
    }
    
    func configure(text: String, recordDate: Date) {
        self.text = text
        self.recordDate = recordDate
    }
    
    func displayData() {
        textView.text = text
        navigationItem.title = dateFormat.string(from: recordDate!)
    }
}
