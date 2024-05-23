//
//  DetailCryptoCoinView.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 20/5/24.
//

import SwiftUI

struct DetailCryptoCoinView: View {
    @ObservedObject var viewModel: DetailCryptoCoinViewModel
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        VStack {
            DetailCryptoCoinHeaderView(crypto: viewModel.crypto)
            
            DetailCryptoCoinCalculateView(
                userInputString: $viewModel.userInputString,
                computedValue: $viewModel.computedValue,
                symbol: viewModel.crypto.symbol,
                computeAction: {
                    viewModel.computeValue()
                }
            )
            Spacer()
        }
        .padding()
        .navigationTitle("Details Crypto Coin")
    }
}

#Preview {
    DetailCryptoCoinView(viewModel: DetailCryptoCoinViewModel(crypto: DetailCryptoCoinEntity(id: "", name: "", logoImage: "", symbol: "", value: "", volume24h: "")))
}
