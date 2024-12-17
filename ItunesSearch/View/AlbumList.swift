//
//  AlbumList.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 17/12/2024.
//
import SwiftUI

struct AlbumListView:View {
    @StateObject var viewModel = AlbumViewModel()
    var body: some View {
        List(viewModel.albums){ album in
            Text(album.artistName)
        }
        .listStyle(.plain)
        .navigationTitle("Albums")
        .searchable(text: $viewModel.searchTerm)
    }
}

#Preview {
    NavigationView {
        AlbumListView()
    }
}
