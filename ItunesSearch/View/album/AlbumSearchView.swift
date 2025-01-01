//
//  AlbumSearchView.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 17/12/2024.
//

import SwiftUI

struct AlbumSearchView:View {
    @StateObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.searchTerm.isEmpty {
                    SearchPlaceholderView(searchTerm: $viewModel.searchTerm)
                } else {
                    AlbumListView(viewModel: viewModel)
                }
                    
            }
            .navigationTitle("Search Albums")
            .searchable(text: $viewModel.searchTerm) 
        }
      
    }
}


#Preview {
    AlbumSearchView()
}
