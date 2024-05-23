//
//  DetailCryptoCoinCalculateView.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 21/5/24.
//

import SwiftUI

struct DetailCryptoCoinCalculateView: View {
    @Binding var userInputString: String
    @Binding var computedValue: Double
    var symbol: String
    var computeAction: () -> Void
    
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        VStack {
            TextField("I Want to Buy for €", text: $userInputString)
                .textFieldStyle(.roundedBorder)
                .padding()
                .keyboardType(.decimalPad)
                .focused($isTextFieldFocused)
                .onChange(of: isTextFieldFocused) {
                    if isTextFieldFocused && userInputString == "0" {
                        userInputString = ""
                    } else if !isTextFieldFocused && userInputString.isEmpty {
                        userInputString = "0"
                    }
                }
            
            Button("Calculate", action: computeAction)
            
            Text("You will have \(computedValue, specifier: "%.4f") of \(symbol)")
                .font(.headline)
        }
    }}
