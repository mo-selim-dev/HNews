//
//  Exitintion.swift
//  HNews
//
//  Created by Mohamed Selim on 07/11/2024.
//

import SwiftUI

extension Color {
    init(hex: String, opacity: Double = 1.0) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        // التأكد من أن الكود يحتوي على 6 أو 8 حروف
        assert(hex.count == 6 || hex.count == 8, "Invalid hex code format. Use 6 or 8 characters.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgbValue)
        
        // إذا كان الكود يحتوي على 8 حروف (بما في ذلك الشفافية)
        let red, green, blue, alpha: Double
        if hex.count == 8 {
            red   = Double((rgbValue & 0xFF000000) >> 24) / 255.0
            green = Double((rgbValue & 0x00FF0000) >> 16) / 255.0
            blue  = Double((rgbValue & 0x0000FF00) >> 8)  / 255.0
            alpha = Double(rgbValue & 0x000000FF) / 255.0
        } else {
            red   = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            green = Double((rgbValue & 0x00FF00) >> 8)  / 255.0
            blue  = Double(rgbValue & 0x0000FF) / 255.0
            alpha = opacity  // استخدام قيمة `opacity` المقدمة من المستخدم
        }
        
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}
