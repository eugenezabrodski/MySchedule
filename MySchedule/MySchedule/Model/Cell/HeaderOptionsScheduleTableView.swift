//
//  HeaderOptionsScheduleTableView.swift
//  MySchedule
//
//  Created by Eugene on 30/01/2024.
//

import UIKit

class HeaderOptionsScheduleTableView: UITableViewHeaderFooterView {
    
    let headerLabel = UILabel(text: "", font: .avenitNext14())
    let headerNameArray = ["Date and Time", "Subject", "Teacher", "Color", "Period"]
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        headerLabel.textColor = .gray
        self.contentView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        self.setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        self.addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
    
    func headerConfigure(section: Int) {
        headerLabel.text = headerNameArray[section]
    }
}
