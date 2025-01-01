//
//  BuyButton.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 21/12/2024.
//

import SwiftUI

struct BuyButton: View {
    let url :String
    let price:Double?
    var body: some View {
        if let urlString = URL(string: url) {
            if let trackPrice = price {
                Link(destination: urlString) {
                    Text(trackPrice.currencyFormat)
                }
                .foregroundColor(.accentColor)
                .padding(.horizontal,10)
                .padding(.vertical ,2)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.accentColor ,lineWidth: 1))
                
            }
        }
    }
}

#Preview {
    BuyButton(url: "u", price: 1.29)
}
