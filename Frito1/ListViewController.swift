//
//  ListViewController.swift
//  Frito1
//
//  Created by 野本エリカ on 2018/05/03.
//  Copyright © 2018年 Life is Tech!. All rights reserved.
//

import UIKit
import TabPageViewController
import RealmSwift

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet var myTableView: UITableView!
    var FoodItems: [Shouhin] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // セル数を返却
        return FoodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ListTableViewCell
        
        cell.nameLabel?.text = FoodItems[indexPath.row].name
        
        cell.accessoryType = .detailButton
        
return cell
    }
    
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        // 選択された品名
        let sel = FoodItems[indexPath.row].name
        
        // アラートを作成
        let alert = UIAlertController(title: "編集", message: "選択してください", preferredStyle: .actionSheet)
        let buttona = UIAlertAction(title: "変更", style: .default, handler: nil)
        
        
        let buttonb = UIAlertAction(title: "削除", style: .destructive, handler: nil)
        let buttonc = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        
        
        alert.addAction(buttona)
        alert.addAction(buttonb)
        alert.addAction(buttonc)
        // アラートを表示
        present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 一覧取得
        let realm = try! Realm()
        let shouhins = realm.objects(Shouhin.self)
        FoodItems = []
        shouhins.forEach { item in
            FoodItems.append(item)
        }
        
        // Top画面表示時にテーブル内容をリロード
        myTableView.reloadData()
    }
    
   
}

