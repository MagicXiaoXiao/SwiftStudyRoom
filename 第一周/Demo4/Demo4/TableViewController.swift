//
//  TableViewController.swift
//  Demo4
//
//  Created by 陈晓波 on 2017/10/21.
//  Copyright © 2017年 漫不经心魔导师. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    lazy var datas: [MyData] = {
        let a1 = MyData(name: "中国", isShow: false, datas: [MyData(name: "北京"),MyData(name: "上海"),MyData(name: "深圳"),MyData(name: "广州")])
        let a2 = MyData(name: "俄罗斯", isShow: false, datas: [MyData(name: "莫斯科"),MyData(name: "西伯利亚"),MyData(name: "叶卡捷琳堡")])
        let data1 = MyData(name: "亚洲", isShow: false, datas: [a1,a2])
        
        let b1 = MyData(name: "巴西", isShow: false, datas: [MyData(name: "巴西利亚"),MyData(name: "圣保罗")])
        let b2 = MyData(name: "阿根廷", isShow: false, datas: [MyData(name: "布宜诺斯艾利斯"),MyData(name: "门多萨"),MyData(name: "圣菲"),MyData(name: "圣路易斯"),MyData(name: "胡胡伊")])
        let data2 = MyData(name: "南美洲", isShow: false, datas: [b1,b2])
        
        let c1 = MyData(name: "澳大利亚", isShow: false, datas: [MyData(name: "悉尼"),MyData(name: "墨尔本"),MyData(name: "堪培拉"),MyData(name: "阿德雷德")])
        let c2 = MyData(name: "新西兰", isShow: false, datas: [MyData(name: "惠灵顿"),MyData(name: "奥克兰")])
        let data3 = MyData(name: "澳洲", isShow: false, datas: [c1,c2])
        return [data1,data2,data3]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TableSectionHeader.self, forHeaderFooterViewReuseIdentifier: "SectionHeader")
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "FirstCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return datas.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let datas = datas[section].datas else { return 0 }
        return self.datas[section].isShow ? datas.count : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath)
        
        if let cell = cell as? TableViewCell,let data = datas[indexPath.section].datas?[indexPath.row] {
            print(indexPath)
            cell.heightDelegate = self
            cell.indexPath = indexPath
            cell.dataTitle = data.name
            cell.datas = data.datas
            cell.isShow = data.isShow
        }
        
        return cell
    }
 

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SectionHeader") as? TableSectionHeader else { return nil}
        
        header.titleButton.setTitle(datas[section].name, for: .normal)
        header.tapAction = {
            self.datas[section].isShow = !self.datas[section].isShow
            tableView.reloadData()
//            tableView.reloadSections(IndexSet(integer: section), with: .fade)
//            tableView.reloadRows(at: [IndexPath(row: 0, section: section)], with: .fade)
        }
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let data = datas[indexPath.section].datas?[indexPath.row] {
            
            return data.isShow ? CGFloat(data.datas!.count) * TableViewSecondCell.cellHeight + TableSectionHeader.sectionHeight : TableSectionHeader.sectionHeight
        }
        return TableSectionHeader.sectionHeight
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TableSectionHeader.sectionHeight
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    
}

extension TableViewController: CellHeightDelegate {
    func updateHeight(indexPath: IndexPath, isShow: Bool) {
        datas[indexPath.section].datas?[indexPath.row].isShow = isShow
//        print(datas[indexPath.section].datas?[indexPath.row].name)
        self.tableView.reloadData()
    }
    
}
