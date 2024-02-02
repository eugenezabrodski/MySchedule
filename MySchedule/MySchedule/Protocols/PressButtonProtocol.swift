//
//  PressButtonProtocol.swift
//  MySchedule
//
//  Created by Eugene on 30/01/2024.
//

import Foundation

protocol PressButtonProtocol: AnyObject {
    func readyButtonTap(indexPath: IndexPath)
}

protocol SwitchRepeatProtocol: AnyObject {
    func switchRepeat(value: Bool)
}
