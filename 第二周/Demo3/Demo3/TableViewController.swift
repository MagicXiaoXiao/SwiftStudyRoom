//
//  TableViewController.swift
//  Demo3
//
//  Created by 漫不经心的魔导师 on 2017/10/27.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var listDatas: [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = true
        
        listDatas += [ToDo(icon: .talk, title: "Go to Disney", date: ^*"2015-10-23"),
                      ToDo(icon: .shop, title: "Cicso Shopping", date: ^*"2016-08-01"),
                      ToDo(icon: .phone, title: "Photo to Jobs", date: ^*"2016-10-01"),
                      ToDo(icon: .air, title: "Plan to Europe", date: ^*"2017-01-01")]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func refreshListAction(_ sender: UIBarButtonItem) {
        tableView.reloadData()
    }
    
    @IBAction func addAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toEdit", sender: nil)
    }
    
    @IBAction func editAction(_ sender: UIBarButtonItem) {
        tableView.setEditing(!tableView.isEditing, animated: true)
        sender.title = tableView.isEditing ? "endEdit" : "Edit"
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDatas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(TableViewCell.self, withIdentifier: UITableViewCell.defaultReuseIdentifier, for: indexPath)
        
        cell.set(data: listDatas[indexPath.row])
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toEdit", sender: (listDatas[indexPath.row], indexPath.row))
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            listDatas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let todo = listDatas.remove(at: fromIndexPath.row)
        listDatas.insert(todo, at: to.row)
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEdit", let vc = segue.destination as? ViewController {
            vc.delegate = self
            vc.data = sender as? (ToDo, Int)
        }
    }
 
}


// MARK: - NavigtionPopDelegate
extension TableViewController: NavigtionPopDelegate {
    func addNewToDo(_ todo: ToDo) {
        defer {
            tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
        }
        listDatas.insert(todo, at: 0)
        
    }
    
    func editToDo(_ todo: ToDo, at index: Int) {
        defer {
            tableView.reloadData()
        }
        listDatas[index] = todo
    }
    
}





