//
//  SongListView.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 19/12/2024.
//
import SwiftUI

struct SongListView:View {
    
    @ObservedObject var viewModel = SongListViewModel()
    
    var body: some View {
        List{
            ForEach(viewModel.songs){ song in
                NavigationLink {
                    SongDetailView(song:song)
                } label: {
                    SongRowView(song: song)
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
        SongListView()
    }
}


