//
//  ContentView.swift
//  TimeConverter
//
//  Created by Nicholas Hwang on 3/3/2025.
//

import SwiftUI

struct HourConversionItemView: View {
    
    // MARK: Stored properties
    let conversionResult: HourConversion
    
    // MARK: Computed properties
    var body: some View {
        
        HStack(spacing: 0) {
            Text("\(conversionResult.timeInHours.formatted(.number.precision(.significantDigits(1...3)))) h")
            
            Text(" = \(conversionResult.timeInMinutes.formatted(.number.precision(.significantDigits(1...3)))) mins")
        }
        .font(.largeTitle)
        
    }
    
}

#Preview {
    HourConversionItemView(conversionResult: HourConversion(timeInHours:7))
}
