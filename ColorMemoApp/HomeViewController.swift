//
//  HomeViewController.swift
//  ColorMemoApp
//
//  Created by Taku Yamada on 2020/11/17.
//

import UIKit
import RealmSwift

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
        
        setNavigationBarButton()
        setLeftNavigationBarButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setMemoData()
    }
    
    func setMemoData() {
        let realm = try! Realm()
        let result = realm.objects(MemoData.self)
        memoDataList = Array(result)
        tableView.reloadData()
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
    
    func setLeftNavigationBarButton() {
        let leftbuttonImage = UIImage(named: "colorSettingIcon")
        let leftButton = UIBarButtonItem(image: leftbuttonImage, style: .plain,
                                         target: self, action: #selector(didTapColorSettingButton))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc func didTapColorSettingButton() {
        let defaultAction = UIAlertAction(title: "デフォルト", style: .default, handler: { _  -> Void in
            self.setThemeColor(color: nil)
        })
        let orangeAction = UIAlertAction(title: "オレンジ", style: .default, handler: { _  -> Void in
            self.setThemeColor(color: MyColor.orange)
        })
        let redAction = UIAlertAction(title: "レッド", style: .default, handler: { _  -> Void in
            self.setThemeColor(color: MyColor.red)
        })
        let blueAction = UIAlertAction(title: "ブルー", style: .default, handler: { _  -> Void in
            self.setThemeColor(color: MyColor.blue)
        })
        let pinkAction = UIAlertAction(title: "ピンク", style: .default, handler: { _  -> Void in
            self.setThemeColor(color: MyColor.pink)
        })
        let greenAction = UIAlertAction(title: "グリーン", style: .default, handler: { _  -> Void in
            self.setThemeColor(color: MyColor.green)
        })
        let purpleAction = UIAlertAction(title: "パープル", style: .default, handler: { _  -> Void in
            self.setThemeColor(color: MyColor.purple)
        })
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        let alert = UIAlertController(title: "テーマカラーを選択してください", message: "", preferredStyle:  .actionSheet)
        
        alert.addAction(defaultAction)
        alert.addAction(orangeAction)
        alert.addAction(redAction)
        alert.addAction(blueAction)
        alert.addAction(pinkAction)
        alert.addAction(greenAction)
        alert.addAction(purpleAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func setThemeColor(color: UIColor?) {
        let textColor: UIColor = color == nil ? .black : .white
        let backgroundColor = color ?? .white
        navigationController?.navigationBar.tintColor = textColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : textColor]
        navigationController?.navigationBar.barTintColor = backgroundColor
    }
    
    // MARK: - UITableViewDelegate
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let targetMemo = memoDataList[indexPath.row]
        let realm = try! Realm()
        try! realm.write {
            realm.delete(targetMemo)
        }
        memoDataList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
