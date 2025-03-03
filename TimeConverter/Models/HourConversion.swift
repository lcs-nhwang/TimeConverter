//
//  HourConversion.swift
//  TimeConverter
//
//  Created by Nicholas Hwang on 3/3/2025.
//

import Foundation

struct HourConversion: Identifiable {
    
    // MARK: Stored properties
    let id = UUID()
    let timeInHours: Double
    
    // MARK: Computed properties
    var timeInMinutes: Double {
        return (timeInHours * 60).rounded(.down)
    }
    
    var timeInSeconds: Double {
        return ((timeInHours * 60 - timeInMinutes) * 60).rounded(.up)
    }
    
}
