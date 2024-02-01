//
//  ColorTaskTableViewController.swift
//  MySchedule
//
//  Created by Eugene on 01/02/2024.
//

import UIKit

class ColorTaskTableViewController: UITableViewController {
    
    let idTasksColorCell = "idTasksColorCell"
    let idTasksHeader = "idTasksHeader"
    let headerNameArray = ["Red", "Orange", "Yellow", "Green", "Blue", "Deep Blue", "Purple"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705253243, alpha: 1)
        tableView.separatorStyle = .none
        tableView.register(ColorTableViewCell.self, forCellReuseIdentifier: idTasksColorCell)
        tableView.register(HeaderOptionsTableView.self, forHeaderFooterViewReuseIdentifier: idTasksHeader)
        title = "Color Tasks"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        7
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idTasksColorCell, for: indexPath) as! ColorTableViewCell
        cell.cellConfigure(indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idTasksHeader) as! HeaderOptionsTableView
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        25
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap Color")
    }
    
    
}
