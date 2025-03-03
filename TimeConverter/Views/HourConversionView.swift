//
//  HourConversionView.swift
//  TimeConverter
//
//  Created by Nicholas Hwang on 3/3/2025.
//

import SwiftUI

struct HourConversionView: View {
    
    // MARK: Stored properties
    @State var viewModel = HourConversionViewModel()
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            // OUTPUT
            if let conversionResult = viewModel.conversionResult {
                
                VStack(spacing: 0) {
                    
                    HourConversionItemView(conversionResult: conversionResult)
                        .padding(.bottom, 30)
                    
                    // Add a button so that the result can be saved
                    Button {
                        viewModel.saveResult()
                        // DEBUG: Show how many items are in the resultHistory array
                        print("There are \(viewModel.resultHistory.count) elements in the resultHistory array.")
                    } label: {
                        Text("Save")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom)
                }
                .frame(height: 250)
                
            } else {
                ContentUnavailableView("Unable to perform conversion", systemImage: "gear.badge.questionmark", description: Text(viewModel.recoverySuggestion))
                    .frame(height: 250)

            }
            
            // INPUT
            TextField("Enter a time in hours", text: $viewModel.providedTimeInHours)
                .textFieldStyle(.roundedBorder)
            
            HStack {
                Text("History")
                    .font(.title2)
                    .bold()
                
                Spacer()
            }
            .padding(.top)
            
            // Iterate over the list of results
            List(viewModel.resultHistory) { currentResult in
                
                HourConversionItemView(conversionResult: currentResult)
                
            }
            .listStyle(.plain)
            
            
        }
        .navigationTitle("Time Converter")
        .padding()
    }
}

#Preview {
    NavigationStack {
        HourConversionView()
    }
}

