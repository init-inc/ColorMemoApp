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
    var dateFormat: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd hh:mm"
        return dateFormatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        
        setMemoData()
        setNavigationBarButton()
    }
    
    func setMemoData() {
        for i in 1...10 {
            let memo = MemoData()
            memo.text = "このメモは\(i)番目です！"
            memo.recordDate = Date()
            memoDataList.append(memo)
        }
    }
    
    func setNavigationBarButton() {
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapAddButton))
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func tapAddButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let memoDetailViewController = storyboard.instantiateViewController(withIdentifier: "MemoDetailViewController") as! MemoDetailViewController
        navigationController?.pushViewController(memoDetailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let memo = memoDataList[indexPath.row]
        cell.textLabel?.text = memo.text
        cell.detailTextLabel?.text = dateFormat.string(from: memo.recordDate)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let memoDetailViewController = storyboard.instantiateViewController(withIdentifier: "MemoDetailViewController") as! MemoDetailViewController
        let memo = memoDataList[indexPath.row]
        memoDetailViewController.configure(memo: memo)
        navigationController?.pushViewController(memoDetailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
