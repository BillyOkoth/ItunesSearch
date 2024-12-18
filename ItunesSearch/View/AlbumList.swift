//
//  AlbumList.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 17/12/2024.
//
import SwiftUI

struct AlbumListView:View {
    
    @ObservedObject var viewModel = AlbumViewModel()
    
    var body: some View {
        List{
            ForEach(viewModel.albums){ album in
                Text(album.collectionName)
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
//                EmptyView()
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
