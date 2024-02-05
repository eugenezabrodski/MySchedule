//
//  ScheduleModel.swift
//  MySchedule
//
//  Created by Eugene on 02/02/2024.
//

import Foundation
import RealmSwift

class ScheduleModel: Object {
    
    @Persisted var scheduleDate: Date?
    @Persisted var scheduleTime: Date?
    @Persisted var scheduleName: String = "Unknown"
    @Persisted var scheduleType: String = "Unknown"
    @Persisted var scheduleBuilding: String = "Unknown"
    @Persisted var scheduleClassroom: String = "Unknown"
    @Persisted var scheduleTeacher: String = "Anton Marchanka"
    @Persisted var scheduleColor: String = "1A4766"
    @Persisted var scheduleRepeat: Bool = true
    @Persisted var scheduleWeekday: Int = 1
    
}
