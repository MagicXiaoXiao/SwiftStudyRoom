//
//  TableViewController.swift
//  Demo2
//
//  Created by 陈晓波 on 2017/10/17.
//  Copyright © 2017年 漫不经心魔导师. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let datas = ["Adsk","Ckds","Bkls","Olaj","Aklll","Inkdsj","Ljkds","Bjkls","Cjkl","Dklld","Aiojd","Ksjk"]
    
    typealias DictionaryValue = (_ key: String)->[String]?
    
    var myDatas:[String:[String]] = [:]
    
    lazy var indexDatas: [String] = {
        return myDatas.keys.map{ $0 }.sorted()
    }()
    
    lazy var dictionaryValue: DictionaryValue = {
        return { key in
            return self.myDatas[key]
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.sectionFooterHeight = CGFloat.leastNonzeroMagnitude
        tableView.sectionIndexTrackingBackgroundColor = .lightGray
        tableView.sectionIndexBackgroundColor = .clear
        
        let newDatas = datas.flatMap { $0.first?.description.uppercased()}
        let indexDatas = Array(Set(newDatas)).sorted()
        
        for item in indexDatas {
            let datas = self.datas.filter{ item == $0.first?.description.uppercased() }
            myDatas[item] = datas
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return myDatas.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = myDatas[indexDatas[section]] else { return 0 }
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        
        if let datas = dictionaryValue(indexDatas[indexPath.section]) {
            cell.textLabel?.text = datas[indexPath.row]
        }

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return indexDatas[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexDatas
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
