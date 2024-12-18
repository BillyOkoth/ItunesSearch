//
//  AlbumSearchView.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 17/12/2024.
//

import SwiftUI

struct AlbumSearchView:View {
    @StateObject var viewModel = AlbumViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.searchTerm.isEmpty {
                    AlbumPlaceholderView(searchTerm: $viewModel.searchTerm)
                } else {
                    AlbumListView(viewModel: viewModel)
                }
                    
            }
            .navigationTitle("Albums")
            .searchable(text: $viewModel.searchTerm) 
        }
      
    }
}
struct AlbumPlaceholderView:View {
    @Binding var searchTerm:String
    
    let suggestions: [String] = ["rammstein", "cry to me", "maneskin"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Trending").font(.title)
            ForEach(suggestions , id: \.self) { text in
                Button {
                    searchTerm = text
                } label: {
                    Text(text).font(.title2)
                }

            }
        }
    }
}

#Preview {
    AlbumSearchView()
}
