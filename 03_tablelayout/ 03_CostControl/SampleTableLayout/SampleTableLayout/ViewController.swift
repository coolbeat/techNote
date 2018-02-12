//
//  ViewController.swift
//  SampleTableLayout
//
//  Created by n_ozawa711 on 2018/02/13.
//  Copyright © 2018年 n_ozawa711. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // tableで使う配列
    private let myItems: NSArray = ["test1", "test2", "test3"]
    private var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // UITableの生成。
        myTableView = UITableView(frame: CGRect(x: 0, y:barHeight, width: displayWidth, height: displayHeight - barHeight))
        
        // Call名の登録。
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        
        // trueで複数選択、falseで単一選択
//        myTableView.allowsMultipleSelection = false
        myTableView.allowsMultipleSelectionDuringEditing = false
        
        self.view.addSubview(myTableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let cell = tableView.cellForRow(at:indexPath)
        cell?.tintColor = UIColor.red
        cell?.backgroundColor = UIColor.clear
        
        // 選択された背景色を白に設定
        let cellSelectedBgView = UIView()
        cellSelectedBgView.backgroundColor = UIColor.cyan
        cell?.selectedBackgroundView = cellSelectedBgView
        
        //チェックマーク
        cell?.accessoryType = .checkmark
    }
    
    
    //セルが非選択の時
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
    
    
    // Cellの総数を返すデータソースメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }
    
    // Cellに値を設定するデータソースメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        
        // Cellに値を設定する
        cell.textLabel!.text = "\(myItems[indexPath.row])"
        
        return cell
    }
    
}

