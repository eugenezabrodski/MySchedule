//
//  TasksTableViewCell.swift
//  MySchedule
//
//  Created by Eugene on 30/01/2024.
//

import UIKit

class TasksTableViewCell: UITableViewCell {
    
    let taskName = UILabel(text: "Swift", font: .avenitNextDemiBold20())
    let taskDescription = UILabel(text: "Create extensions", font: .avenitNext14())
    let readyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    weak var cellTaskDelegate: PressButtonProtocol?
    var indexPath: IndexPath?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setConstraints()
        self.selectionStyle = .none
        taskDescription.numberOfLines = 2
        readyButton.addTarget(self, action: #selector(readyButtonTap), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func readyButtonTap() {
        guard let indexPath = indexPath else { return }
        cellTaskDelegate?.readyButtonTap(indexPath: indexPath)
    }
    
    func configure(model: TaskModel) {
        taskName.text = model.taskName
        taskDescription.text = model.taskDescription
        backgroundColor = UIColor().colorFromHex("\(model.taskColor)")
        
        if model.taskReady {
            readyButton.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            readyButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    func setConstraints() {
        self.contentView.addSubview(readyButton)
        NSLayoutConstraint.activate([
            readyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            readyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            readyButton.heightAnchor.constraint(equalToConstant: 40),
            readyButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        self.addSubview(taskName)
        NSLayoutConstraint.activate([
            taskName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            taskName.trailingAnchor.constraint(equalTo: readyButton.leadingAnchor, constant: -5),
            taskName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            taskName.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        self.addSubview(taskDescription)
        NSLayoutConstraint.activate([
            taskDescription.topAnchor.constraint(equalTo: taskName.bottomAnchor, constant: 5),
            taskDescription.trailingAnchor.constraint(equalTo: readyButton.leadingAnchor, constant: -5),
            taskDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            taskDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
}
