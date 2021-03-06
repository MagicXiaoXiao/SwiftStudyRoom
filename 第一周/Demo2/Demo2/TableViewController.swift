//
//  TableViewController.swift
//  Demo2
//
//  Created by 陈晓波 on 2017/10/17.
//  Copyright © 2017年 漫不经心魔导师. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var datas:[String] = ["Adsk","Ckds","Bkls","Olaj","Aklll","Inkdsj","Ljkds","Bjkls","Cjkl","Dklld","Aiojd","Ksjk"]
    
    typealias DictionaryValue = (_ section: Int)->[String]?
    
    var myDatas:[String:[String]] = [:]
    
    lazy var indexDatas: [String] = {
        return myDatas.keys.map{ $0 }.sorted()
    }()
    
    lazy var dictionaryValue: DictionaryValue = {
        return { return self.myDatas[self.indexDatas[$0]] }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.sectionFooterHeight = CGFloat.leastNonzeroMagnitude
        tableView.sectionIndexTrackingBackgroundColor = .lightGray
        tableView.sectionIndexBackgroundColor = .clear
        
        let newDatas = datas.flatMap { $0.first?.description.uppercased() }
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
        
        if let datas = dictionaryValue(indexPath.section) {
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
    
    //洁癖可无视
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
