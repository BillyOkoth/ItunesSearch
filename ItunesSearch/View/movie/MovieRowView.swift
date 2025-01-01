//
//  MovieRowView.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 21/12/2024.
//

import SwiftUI
   
struct MovieRowView: View {
    let movie:Movie

    var body: some View {
        HStack {
            ImageLoadingView(urlString: movie.artworkUrl100, size: 100)
            VStack(alignment:.leading) {
                Text(movie.trackName)
                
                Text(movie.primaryGenreName)
                    .foregroundColor(.gray)
                Text(movie.releaseDate.dateFormat)
            }
            .font(.caption)
            Spacer(minLength: 20)
            BuyButton(url: movie.previewURL ?? "", price: movie.trackPrice)
        }
    }
}

#Preview {
    MovieRowView(movie: Movie.preview)
}
