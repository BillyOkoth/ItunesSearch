//
//  SongRowView.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 21/12/2024.
//

import SwiftUI

struct SongRowView: View {
    let song: Song
    var body: some View {
        HStack {
            ImageLoadingView(urlString: song.artworkUrl60, size: 60)
            VStack (alignment: .leading) {
                Text(song.trackName)
                Text(song.artistName + " - " + song.collectionName)
                   .font(.caption)
                   .foregroundColor(.gray)
            }
            .lineLimit(1)
            Spacer(minLength: 20)
            BuyButton(url: song.previewURL, price: song.trackPrice)
           
        }
        
    }
}
#Preview { SongRowView(song: Song.preview) }

extension Double {
    var currencyFormat : String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: NSNumber(value: Float(self) )) ?? ""
    }
}
