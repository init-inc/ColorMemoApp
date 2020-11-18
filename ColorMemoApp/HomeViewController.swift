//
//  HomeViewController.swift
//  ColorMemoApp
//
//  Created by Taku Yamada on 2020/11/17.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var memoDataList: [MemoData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        
        setMemoData()
    }
    
    func setMemoData() {
        for i in 1...10 {
            let memo = MemoData(text: "このメモは\(i)番目です！", recordDate: Date())
            memoDataList.append(memo)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let memo = memoDataList[indexPath.row]
        cell.textLabel?.text = memo.text
        cell.detailTextLabel?.text = "\(memo.recordDate)"
        return cell
    }
}
