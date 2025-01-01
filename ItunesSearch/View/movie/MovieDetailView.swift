//
//  MovieDetailView.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 30/12/2024.
//

import SwiftUI
import AVKit

struct MovieDetailView: View {
    @State private var isExpanded: Bool = false
    
    
    let movie: Movie
    var body: some View {
        MovieHeaderView(movie: movie)
       
        ScrollView {
            VStack(alignment:.leading) {
                Text("Trailers") .foregroundColor(Color(.label))
                if let urlString = movie.previewURL {
                    VideoPlayer(player: AVPlayer(url: URL( string: urlString)!)).frame(width: .infinity , height: 150 ).padding()
                }
            }
            .padding()
            Divider()
            VStack(alignment: .leading) {
                Text("About the Film").padding(.bottom)
                ExpandableText(movie.longDescription ?? "", lineLimit: 3)
            }
            .padding()
            Divider()
            VStack(alignment: .leading) {
                Text("Information").padding(.bottom)
                HStack {
                    Grid(horizontalSpacing: 20 ,verticalSpacing: 10) {
                        GridRow {
                            Text("Genre").modifier(InfoTextHeader())
                                
                            Text(movie.primaryGenreName).modifier(InfoTextValue())
                        }
                        
                        .gridColumnAlignment(.listRowSeparatorLeading)
                        GridRow {
                            Text("Released").modifier(InfoTextHeader())
                            
                            Text(movie.releaseDate.dateFormat).modifier(InfoTextValue())
                        }
                        .gridColumnAlignment(.listRowSeparatorLeading)
                        
                        GridRow {
                            Text("Run Time").modifier(InfoTextHeader())
                            Text(movie.trackTimeMillis?.formattedDuration() ?? "" ).modifier(InfoTextValue())
                        }
                        .gridColumnAlignment(.listRowSeparatorTrailing)
                    }
                    Spacer()
                }
                
            }
            .padding()
            Spacer()
        }
            
    }
}

#Preview {
    MovieDetailView(movie: Movie.preview2)
}


struct MovieHeaderView:View {
    let movie:Movie
    var body: some View {
        HStack {
            ImageLoadingView(urlString: movie.artworkUrl100, size: 100)
            VStack (alignment: .leading){
                Text(movie.trackName)
                    .font(.footnote)
                    .foregroundColor(Color(.label))
                Text(movie.releaseDate.dateFormat)
                    .font(.caption).foregroundStyle(.secondary)
            }
            .foregroundColor(.gray)
            .lineLimit(1)
            Spacer()
            BuyButton(url: movie.artistViewURL ?? " ", price: movie.collectionPrice)
        }
        .padding()
        .background(
            Color(.systemBackground).edgesIgnoringSafeArea(.top).shadow(radius: 5)
        )

        
    }
}




struct InfoTextHeader:ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.callout)
            .foregroundColor(.gray)
            .fontWeight(.bold)
    }
}

struct InfoTextValue:ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.callout)
            .foregroundColor(.gray)
            .fontWeight(.light)
    }
}
