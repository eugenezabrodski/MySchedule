//
//  ContactModel.swift
//  MySchedule
//
//  Created by Eugene on 05/02/2024.
//

import Foundation
import RealmSwift

class ContactModel: Object {
    @Persisted var contactsName = "Unknown"
    @Persisted var contactsPhone = "Unknown"
    @Persisted var contactsMail = "Unknown"
    @Persisted var contactsType = "Unknown"
    @Persisted var contactsImage: Data?
    
}
