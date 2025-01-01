//
//  MovieSearchView.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 19/12/2024.
//

import SwiftUI

struct MovieSearchView:View {
    @StateObject var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.searchTerm.isEmpty {
                    SearchPlaceholderView(searchTerm: $viewModel.searchTerm)
                } else {
                    MovieListView(viewModel: viewModel)
                }
                    
            }
            .navigationTitle("Search Movies")
            .searchable(text: $viewModel.searchTerm)
        }
      
    }
}

#Preview {
    MovieSearchView()
}
