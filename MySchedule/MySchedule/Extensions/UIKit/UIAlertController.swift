//
//  UIAlertController.swift
//  MySchedule
//
//  Created by Eugene on 30/01/2024.
//

import UIKit

extension UIAlertController {
    
    func negativeWidthConstraint() {
        for subView in self.view.subviews {
            for constraint in subView.constraints where constraint.debugDescription.contains("width == -16") {
                subView.removeConstraint(constraint)
            }
        }
    }
}
