//
//  SearchView.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 19/12/2024.
//

import SwiftUI

struct SearchView :View{
    @State private var searchTerm:String = ""
    @State private var selectedEntityType = EntityType.all
    
    @StateObject private var albumListViewModel = AlbumListViewModel()
    @StateObject private var songListViewModel = SongListViewModel()
    @StateObject private var movieListViewModel = MovieListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Picker("Select the media type", selection: $selectedEntityType) {
                    ForEach(EntityType.allCases) { type in
                        Text(type.name()).tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                 Divider()
                
                if searchTerm.isEmpty {
                    SearchPlaceholderView(searchTerm: $searchTerm)
                        .frame(maxHeight : .infinity)
                } else {
                    switch selectedEntityType {
                    case .album:
                        AlbumListView(viewModel: albumListViewModel)
                            .onAppear {
                            albumListViewModel.searchTerm = searchTerm
                        }
                    case .song:
                        SongListView(viewModel: songListViewModel)
                            .onAppear {
                                songListViewModel.searchTerm = searchTerm
                            }
                    case .movie:
                        MovieListView(viewModel: movieListViewModel)
                            .onAppear {
                                movieListViewModel.searchTerm = searchTerm
                            }
                    case .all:
                        SearchAllListView(albumListVM: albumListViewModel, songListVM: songListViewModel, movieListVM: movieListViewModel)
                    }
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchTerm)
            .onChange(of: searchTerm) { oldValue , newValue in
                
                switch selectedEntityType {
                case .all:
                    songListViewModel.searchTerm = newValue
                    albumListViewModel.searchTerm = newValue
                    movieListViewModel.searchTerm = newValue
                case .album:
                    albumListViewModel.searchTerm = newValue
                case .song:
                    songListViewModel.searchTerm = newValue
                case .movie:
                    movieListViewModel.searchTerm = newValue
                }
            }
            
        }
    }
}

#Preview {
    SearchView()
}
