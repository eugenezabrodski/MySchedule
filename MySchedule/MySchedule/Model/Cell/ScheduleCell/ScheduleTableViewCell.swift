//
//  ScheduleTableViewCell.swift
//  MySchedule
//
//  Created by Eugene on 29/01/2024.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    let lessonName = UILabel(text: "Swift", font: .avenitNextDemiBold20())
    let teacherName = UILabel(text: "Anton Marchanka", font: .avenitNext20(), alignment: .right)
    let lessonTime = UILabel(text: "09:00", font: .avenitNextDemiBold20())
    let typeLabel = UILabel(text: "Type:", font: .avenitNext14(), alignment: .right)
    let lessonType = UILabel(text: "Lection", font: .avenitNextDemiBold14())
    let buildingLabel = UILabel(text: "Building:", font: .avenitNext14(), alignment: .right)
    let lessonBuilding = UILabel(text: "1", font: .avenitNextDemiBold14())
    let audLabel = UILabel(text: "Classroom:", font: .avenitNext14(), alignment: .right)
    let lessonAud = UILabel(text: "815", font: .avenitNextDemiBold14())

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setConstraints()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        
        let topStackView = UIStackView(arrangedSubviews: [lessonName, teacherName], axis: .horizontal, spacing: 10, distribution: .fillEqually)
        
        self.addSubview(topStackView)
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            topStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            topStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        self.addSubview(lessonTime)
        NSLayoutConstraint.activate([
            lessonTime.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            lessonTime.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            lessonTime.widthAnchor.constraint(equalToConstant: 100),
            lessonTime.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        let bottomStackView = UIStackView(arrangedSubviews: [typeLabel, lessonType, buildingLabel, lessonBuilding, audLabel, lessonAud], axis: .horizontal, spacing: 5, distribution: .fillProportionally)
        self.addSubview(bottomStackView)
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            bottomStackView.leadingAnchor.constraint(equalTo: lessonTime.trailingAnchor, constant: 5),
            bottomStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            bottomStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
