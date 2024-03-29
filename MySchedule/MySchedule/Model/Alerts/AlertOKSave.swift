//
//  AlertOKSave.swift
//  MySchedule
//
//  Created by Eugene on 02/02/2024.
//

import UIKit

extension UIViewController {
    
    func alertOKSave(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
