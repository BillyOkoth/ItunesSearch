//
//  AlbumHeaderDetailView.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 24/12/2024.
//

import SwiftUI

struct AlbumHeaderDetailView: View {
    
    @State private var isExpanded: Bool = false
    
    let album: Album
    var body: some View {
        HStack(alignment: .bottom) {
            ImageLoadingView(urlString: album.artworkUrl100, size: 100)
            VStack(alignment:.leading) {
                Text(album.collectionName)
                    .font(.footnote)
                    .foregroundColor(Color(.label))
                Text(album.artistName).padding(.bottom ,5)
                Text(album.primaryGenreName)
                Text(album.trackCount == 1 ? "\(album.trackCount) Song" : "\(album.trackCount) Songs")
                Text("\(album.releaseDate.dateFormat)")
                
            }
            .font(.caption)
            .foregroundColor(.gray)
            .lineLimit(1)
            Spacer()
            BuyButton(url: album.collectionViewURL, price: album.collectionPrice)
        }
        .padding()
        .background(
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.top)
                .shadow(radius: 5)
        )

        Spacer()
        
    }
}

#Preview {
    AlbumHeaderDetailView(album: Album.preview)
}
