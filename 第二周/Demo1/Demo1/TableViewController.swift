//
//  TableViewController.swift
//  Demo1
//
//  Created by 漫不经心的魔导师 on 2017/10/25.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let sectinTitles = ["Friends","Ohter"]
    var datas: DefaultDatas?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearsSelectionOnViewWillAppear = true
        
        do {
            datas = try JSONDecoder().decode(DefaultDatas.self, from: DefaultDatas.json.data(using: .utf8)!)
            
        } catch let error {
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectinTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let datas = datas else { return 0 }
        switch section {
        case 0:
            return datas.friends.count
        case 1:
            return datas.other.count
        default:
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath)
        if let myCell = cell as? TableViewCell,let datas = datas {
            switch indexPath.section {
            case 0:
                myCell.avatarImageView.image = UIImage(named:datas.friends[indexPath.row].avatar)
                myCell.nickNameLabel.text = datas.friends[indexPath.row].name
            case 1:
                myCell.avatarImageView.image = UIImage(named:datas.other[indexPath.row].avatar)
                myCell.nickNameLabel.text = datas.other[indexPath.row].name
            default:
                break
            }
        }
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectinTitles[section]
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let datas = datas else { return }
        
        var selectUser: User?
        
        switch indexPath.section {
        case 0:
            selectUser = datas.friends[indexPath.row]
        case 1:
            selectUser = datas.other[indexPath.row]
        default:
            break
        }
        
        performSegue(withIdentifier: "toInfoCard", sender: selectUser)
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInfoCard",
            let vc = segue.destination as? InfoTableViewController {
            vc.user = sender as? User
        }
        
    }
    

}
