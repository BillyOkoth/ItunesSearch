//
//  AlbumList.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 17/12/2024.
//
import SwiftUI

struct AlbumListView:View {
    
    @ObservedObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        List{
            ForEach(viewModel.albums){ album in
                NavigationLink {
                    AlbumDetailView(album: album)
                } label: {
                    AlbumRowView(album: album)
                }
                
            }
            switch viewModel.state {
            case .good:
                Color.clear.onAppear {
                    viewModel.loadMore()
                }
            case .isLoading:
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(maxWidth: .infinity)
            case .loadedAll:
                Color.clear
            case .error(let string):
                Text(string).foregroundColor(.pink)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    NavigationView {
        AlbumListView()
    }
}
