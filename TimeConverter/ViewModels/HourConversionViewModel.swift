//
//  HourConversionViewModel.swift
//  TimeConverter
//
//  Created by Nicholas Hwang on 3/3/2025.
//

import Foundation

@Observable
class HourConversionViewModel {
    //MARK: Stored Properties
    var resultHistory: [HourConversion] = []
    var providedTimeInHours: String
    var recoverySuggestion: String = ""
    //MARK: Computed Properties
    var conversionResult: HourConversion? {
        guard let timeInHours = Double(providedTimeInHours), timeInHours >= 0 else {
            recoverySuggestion = "Please enter a valid time."
            return nil
        }
        recoverySuggestion = ""
        return HourConversion(timeInHours: timeInHours)
    }
    //MARK: Initializers
    init(
        providedTimeInHours: String = "",
        recoverySuggestion: String = ""
    ) {
        self.providedTimeInHours = providedTimeInHours
        self.recoverySuggestion = recoverySuggestion
    }
    func saveResult() {
        if let conversionResult = self.conversionResult{
            self.resultHistory.insert(conversionResult, at: 0)
        }
    }
    
}
