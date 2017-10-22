//
//  TableViewCell.swift
//  Demo4
//
//  Created by 陈晓波 on 2017/10/20.
//  Copyright © 2017年 漫不经心魔导师. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let minHeight: CGFloat = 45
    @IBOutlet weak var tableView: UITableView!
    
    var indexPath: IndexPath?
    var dataTitle: String?{
        didSet{
            tableView.reloadData()
        }
    }
    var datas:[MyData]?
    
    weak var heightDelegate: CellHeightDelegate?
    var isShow = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableView.register(UINib(nibName: "TableViewSecondCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.register(TableSectionHeader.self, forHeaderFooterViewReuseIdentifier: "SectionHeader")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

extension TableViewCell: UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = datas else { return 0 }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = datas?[indexPath.row].name
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TableSectionHeader.sectionHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SectionHeader") as? TableSectionHeader else { return nil}
        header.contentView.backgroundColor = .blue
        header.titleButton.setTitle(dataTitle, for: .normal)
        header.tapAction = {
            self.isShow = !self.isShow
            if let index = self.indexPath {
                self.heightDelegate?.updateHeight(indexPath: index, isShow: self.isShow)
            }

        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return TableViewSecondCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
