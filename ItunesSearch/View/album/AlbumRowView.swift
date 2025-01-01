//
//  AlbumRowView.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 21/12/2024.
//
import SwiftUI

struct AlbumRowView: View {
    let album: Album
    
    var body: some View {
        HStack {
            ImageLoadingView(urlString: album.artworkUrl100, size: 100)
            VStack(alignment:.leading) {
                Text(album.collectionName)
                Text(album.artistName)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .lineLimit(1)
            Spacer(minLength: 20)
            BuyButton(url: album.collectionViewURL, price: album.collectionPrice)
        }
       
        
    }
}

#Preview {
    AlbumRowView(album: Album.preview)
}
