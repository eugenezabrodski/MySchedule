//
//  ScheduleModel.swift
//  MySchedule
//
//  Created by Eugene on 02/02/2024.
//

import Foundation
import RealmSwift

class ScheduleModel: Object {
    
    @Persisted var scheduleDate =  Date()
    @Persisted var scheduleTime = Date()
    @Persisted var scheduleName: String = ""
    @Persisted var scheduleType: String = ""
    @Persisted var scheduleBuilding: String = ""
    @Persisted var scheduleClassroom: String = ""
    @Persisted var scheduleTeacher: String = "Name Lastname"
    @Persisted var scheduleColor: String = "1A4766"
    @Persisted var scheduleRepeat: Bool = true
    @Persisted var scheduleWeekday: Int = 1
    
}
