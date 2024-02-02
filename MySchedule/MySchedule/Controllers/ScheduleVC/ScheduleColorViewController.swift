//
//  ScheduleColorViewController.swift
//  MySchedule
//
//  Created by Eugene on 30/01/2024.
//

import UIKit

class ScheduleColorViewController: UITableViewController {
    
    let idOptionsColorCell = "idOptionsColorCell"
    let idOptionsHeader = "idOptionsColorHeader"
    let headerNameArray = ["Red", "Orange", "Yellow", "Green", "Blue", "Deep Blue", "Purple"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705253243, alpha: 1)
        tableView.separatorStyle = .none
        tableView.register(ColorTableViewCell.self, forCellReuseIdentifier: idOptionsColorCell)
        tableView.register(HeaderOptionsTableView.self, forHeaderFooterViewReuseIdentifier: idOptionsHeader)
        title = "Color"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        7
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsColorCell, for: indexPath) as! ColorTableViewCell
        cell.cellConfigure(indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsHeader) as! HeaderOptionsTableView
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        25
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0: setColor(color: "BE2813")
        case 1: setColor(color: "F07F5A")
        case 2: setColor(color: "F3AF22")
        case 3: setColor(color: "467C24")
        case 4: setColor(color: "2D7FC1")
        case 5: setColor(color: "1A4766")
        default: setColor(color: "2D038F")
        }
    }
    
    private func setColor(color: String) {
        let scheduleOptions = self.navigationController?.viewControllers[1] as? OptionsScheduleViewController
        scheduleOptions?.hexColorCell = color
        scheduleOptions?.tableView.reloadRows(at: [[3,0]], with: .none)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
