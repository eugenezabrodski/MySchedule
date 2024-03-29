//
//  TaskOptionTableView.swift
//  MySchedule
//
//  Created by Eugene on 01/02/2024.
//

import UIKit

class TaskOptionTableView: UITableViewController {
    
    let idOptionsTasksCell = "idOptionsTasksCell"
    let idOptionsHeader = "idOptionsTasksHeader"
    
    let headerNameArray = ["Date", "Name", "Task", "Color"]
    let cellNameArray = ["Date", "Name", "Task", ""]
    
    var hexColor = "1A4766"
    private var taskModel = TaskModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = #colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705253243, alpha: 1)
        tableView.separatorStyle = .none
        
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsTasksCell)
        tableView.register(HeaderOptionsTableView.self, forHeaderFooterViewReuseIdentifier: idOptionsHeader)
        
        title = "Create task"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTap))
    }
    
    @objc func saveButtonTap() {
        if taskModel.taskDate == nil || taskModel.taskName == "Unknown" {
            alertOKSave(title: "Error", message: "Requierd fields: DATE, LESSON")
        } else {
            taskModel.taskColor = hexColor
            RealmManager.shared.saveTaskModel(model: taskModel)
            taskModel = TaskModel()
            alertOKSave(title: "Succes", message: "You saved the task")
            hexColor = "1A4766"
            tableView.reloadData()
        }
    }
    
    private func pushControllers(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Back"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsTasksCell, for: indexPath) as! OptionsTableViewCell
        cell.cellTasksConfigure(nameArray: cellNameArray, indexPath: indexPath, hexColor: hexColor)
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
        
        switch indexPath.section {
        case 0: alertDate(label: cell.nameCellLabel) { numberWeekDay, date in
            self.taskModel.taskDate = date
        }
        case 1: alertForCellName(label: cell.nameCellLabel, name: "Name Lesson", placeholder: "Enter lesson name") { text in
            self.taskModel.taskName = text
        }
        case 2: alertForCellName(label: cell.nameCellLabel, name: "Name Task", placeholder: "Enter task")  { text in
            self.taskModel.taskDescription = text
        }
        default: pushControllers(vc: ColorTaskTableViewController())
        }
    }
    
}
