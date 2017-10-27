//
//  TableViewController.swift
//  Demo4
//
//  Created by 漫不经心的魔导师 on 2017/10/28.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var count = 10
    
    lazy var alert1: UIActivityViewController = {
        let a = UIActivityViewController(activityItems: [
            UIActivityType.postToTencentWeibo,
            UIActivityType.copyToPasteboard,
            UIActivityType.postToWeibo,
            UIActivityType.copyToPasteboard,
            UIActivityType.postToVimeo
            ], applicationActivities: nil)
        return a
    }()
    
    lazy var alert2: UIAlertController = {
        let a = UIAlertController(title: "下载", message: "该功能暂未开放", preferredStyle: .alert)
        let action = UIAlertAction(title: "好的", style: .default, handler: nil)
        a.addAction(action)
        return a
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reloadDataAction(_ sender: UIBarButtonItem) {
        count = 10
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if let imageView = cell.viewWithTag(101) as? UIImageView,
            let label = cell.viewWithTag(102) as? UILabel {
            imageView.image = UIImage(named: "\(indexPath.row+1)")
            label.text = "\(indexPath.row)"
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action1 = UIContextualAction(style: .destructive, title: "🗑️\nDelete") { (action, view, finish) in
            self.count-=1
            tableView.deleteRows(at: [indexPath], with: .fade)
            finish(true)
        }
        let action2 = UIContextualAction(style: .normal, title: "🤗\nShare") { (action, view, finish) in
            self.present(self.alert1, animated: true, completion: nil)
            finish(true)
        }
        action2.backgroundColor = .blue
        let action3 = UIContextualAction(style: .normal, title: "⬇️\nDownload") { (action, view, finish) in
            self.present(self.alert2, animated: true, completion: nil)
            finish(true)
        }
        action3.backgroundColor = .orange
        return UISwipeActionsConfiguration(actions: [action1,action2,action3])
    }

}
