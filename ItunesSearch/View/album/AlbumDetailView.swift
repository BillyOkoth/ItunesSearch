//
//  AlbumDetailView.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 29/12/2024.
//

import SwiftUI

struct AlbumDetailView: View {
    let album:Album
    
    @StateObject var songsVM : SongForAlbumListViewModel
    
    init(album: Album) {
        self.album = album
        self._songsVM = StateObject(wrappedValue: SongForAlbumListViewModel(albumId: album.id))
    }
    
    var body: some View {
        VStack {
            AlbumHeaderDetailView(album: album)
            ScrollView {
                SongsGridView(songs: songsVM.songs ,selectedSong: nil)
            }
        }
        .onAppear {
            songsVM.fetch()
        }
    }
}

#Preview {
    AlbumDetailView(album: Album.preview)
}
