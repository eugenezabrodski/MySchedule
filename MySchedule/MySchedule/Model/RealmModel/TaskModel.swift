//
//  TaskModel.swift
//  MySchedule
//
//  Created by Eugene on 05/02/2024.
//

import Foundation
import RealmSwift

class TaskModel: Object {
    @Persisted var taskDate: Date?
    @Persisted var taskName = "Unknown"
    @Persisted var taskDescription = "Unknown"
    @Persisted var taskColor = "1A4766"
    @Persisted var taskReady: Bool = false
}
