//
//  SearchAllView.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 19/12/2024.
//

import SwiftUI

struct SearchAllListView:View {
    @ObservedObject var albumListVM:AlbumListViewModel
    @ObservedObject var songListVM:SongListViewModel
    @ObservedObject var movieListVM:MovieListViewModel
    
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 5){
               if !songListVM.songs.isEmpty {
                   SectionHeaderView(title: "Songs") {
                       SongListView(viewModel: songListVM)
                   }
                   .padding(.top)
                   
                   SongSectionView(songs: songListVM.songs)
                   
                   Divider().padding([.horizontal ,.bottom])
                }
               
                if !albumListVM.albums.isEmpty {
                    SectionHeaderView(title: "Albums") {
                         AlbumListView(viewModel: albumListVM)
                     }
                    AlbumSectionView(albums: albumListVM.albums)
                    Divider().padding([.horizontal ,.bottom])
                }
                
                if !movieListVM.movies.isEmpty {
                    SectionHeaderView(title: "Movies") {
                        MovieListView(viewModel: movieListVM)
                    }
                    MovieSectionView(movies: movieListVM.movies)
                }
            }
            
        }
    }
}

#Preview {
    SearchAllListView(albumListVM: AlbumListViewModel.example(), songListVM: SongListViewModel.example(), movieListVM: MovieListViewModel.example())
}



struct SectionHeaderView<Destination>: View where Destination: View {
    let title: String
    let destination: () -> Destination
    
    init(title: String, @ViewBuilder destination: @escaping () -> Destination) {
        self.title = title
        self.destination = destination
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
            Spacer()
            NavigationLink (destination: destination){
                HStack {
                    Text("See All")
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(.gray)
            }
        }
        .padding(.horizontal)
    }
}
