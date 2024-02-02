//
//  UIColor.swift
//  MySchedule
//
//  Created by Eugene on 02/02/2024.
//

import UIKit

extension UIColor {
    
    
    func colorFromHex(_ hex: String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count != 6 {
            return UIColor.black
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255,
                            green: CGFloat((rgb & 0x00FF00) >> 8) / 255,
                            blue: CGFloat(rgb & 0x0000FF) / 255,
                            alpha: 1.0)
    }
}


    
