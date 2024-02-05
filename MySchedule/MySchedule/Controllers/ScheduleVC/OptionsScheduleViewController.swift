//
//  OptionsScheduleViewController.swift
//  MySchedule
//
//  Created by Eugene on 30/01/2024.
//

import UIKit

class OptionsScheduleViewController: UITableViewController {
    
    let idOptionsCell = "idOptionsCell"
    let idOptionsHeader = "idOptionsHeader"
    let headerNameArray = ["Date and Time", "Subject", "Teacher", "Color", "Period"]
    let cellNameArray = [["Date","Time"],
                         ["Name","Type","Building", "Classroom"],
                         ["Teacher"],
                         [""],
                         ["Repeat after 7 days"]]
    private var scheduleModel = ScheduleModel()
    var hexColorCell = "8E5AF7"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705253243, alpha: 1)
        tableView.separatorStyle = .none
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsCell)
        tableView.register(HeaderOptionsTableView.self, forHeaderFooterViewReuseIdentifier: idOptionsHeader)
        title = "Create task"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTask))
    }
    
    @objc private func saveTask() {
        if scheduleModel.scheduleDate == nil || scheduleModel.scheduleTime == nil || scheduleModel.scheduleName == "Unknown" {
            alertOKSave(title: "Error", message: "Required fileds: DATE, TIME, NAME")
        } else {
            scheduleModel.scheduleColor = hexColorCell
            RealmManager.shared.saveScheduleModel(model: scheduleModel)
            scheduleModel = ScheduleModel()
            alertOKSave(title: "Success", message: "You saved the task")
            hexColorCell = "8E5AF7"
            tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return 4
        case 2: return 1
        case 3: return 1
        default: return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsCell, for: indexPath) as! OptionsTableViewCell
        cell.cellScheduleConfigure(nameArray: cellNameArray, indexPath: indexPath, hexColor: hexColorCell)
        cell.switchRepeatDelegate = self
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
        
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        
        switch indexPath {
        case [0,0]: 
            alertDate(label: cell.nameCellLabel) { numberWeekday, date in
            self.scheduleModel.scheduleDate = date
            self.scheduleModel.scheduleWeekday = numberWeekday
        }
        case [0,1]: 
            alertTime(label: cell.nameCellLabel) { time in
            self.scheduleModel.scheduleTime = time
        }
        case [1, 0]: 
            alertForCellName(label: cell.nameCellLabel, name: "Subject", placeholder: "Enter name of subject")  { text in
            self.scheduleModel.scheduleName = text
        }
        case [1, 1]: 
            alertForCellName(label: cell.nameCellLabel, name: "Type", placeholder: "Lection or seminar")  { text in
            self.scheduleModel.scheduleType = text
        }
        case [1, 2]: 
            alertForCellName(label: cell.nameCellLabel, name: "Building Number", placeholder: "Enter number of building")  { text in
            self.scheduleModel.scheduleBuilding = text
        }
        case [1, 3]: 
            alertForCellName(label: cell.nameCellLabel, name: "Classrom", placeholder: "Enter number of classroom")  { text in
            self.scheduleModel.scheduleClassroom = text
        }
            
        case [2,0]:
            pushControllers(vc: TeachersVC())
        case [3,0]:
            pushControllers(vc: ScheduleColorViewController())
        default: print("Tap options Table View")
        }
    }
    
    private func pushControllers(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Back"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension OptionsScheduleViewController: SwitchRepeatProtocol {
    func switchRepeat(value: Bool) {
        scheduleModel.scheduleRepeat = value
    }
    
    
}
