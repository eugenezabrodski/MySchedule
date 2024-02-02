//
//  AlertForCellName.swift
//  MySchedule
//
//  Created by Eugene on 30/01/2024.
//

import UIKit

extension UIViewController {
    
    func alertForCellName(label: UILabel, name: String, placeholder: String, completionHandler: @escaping (String) -> Void) {
        
        let alert = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default) { action in
            let tfAlert = alert.textFields?.first
            guard let text = tfAlert?.text else { return }
            label.text = (text != "" ? text : label.text)
            completionHandler(text)
        }
        alert.addTextField { tfAlert in
            tfAlert.placeholder = placeholder
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
}
