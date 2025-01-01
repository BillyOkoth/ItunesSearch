//
//  SongDetailView.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 23/12/2024.
//

import SwiftUI

struct SongDetailView: View {
    @StateObject var songsViewModel: SongForAlbumListViewModel
    @StateObject var albumsViewModel = AlbumForSongViewModel()

    let song: Song
    let selectedSong: Song?

    init(song: Song) {
        self.song = song
        let albumId = song.collectionID
        self._songsViewModel = StateObject(
            wrappedValue: SongForAlbumListViewModel(albumId: albumId))
        self.selectedSong = song
    }

    var body: some View {

        ScrollViewReader { proxy in
            VStack {
                if let album = albumsViewModel.album {
                    AlbumHeaderDetailView(album: album)
                }
                else {
                    ProgressView().progressViewStyle(.circular)
                }
                SongsForAlbumListView(songsViewModel: songsViewModel, selectedSong: selectedSong)
            }
            .onAppear {
                songsViewModel.fetch()
                albumsViewModel.fetch(for: song)
                
            }
        }

    }
}

#Preview {
    SongDetailView(song: Song.preview)
}

struct SongsGridView: View {
    let songs: [Song]
    let selectedSong: Song?

    var body: some View {
        Grid(horizontalSpacing: 20) {
            ForEach(songs) { song in
                GridRow {
                    Text("\(song.trackNumber)")
                        .font(.footnote)
                        .gridColumnAlignment(.trailing)
                    Text("\(song.trackName)")
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(song.trackTimeMillis.formattedDuration())
                    BuyButton(url: song.previewURL, price: song.trackPrice)
                        .padding(.trailing)
                }
                .foregroundColor(selectedSong?.id == song.id ? .blue : .primary)
                .id(song.trackNumber)

                Divider().gridCellUnsizedAxes(.horizontal)

            }
        }
        .padding([.bottom, .leading])

    }
}

struct SongsForAlbumListView:View {
    
    @ObservedObject var songsViewModel: SongForAlbumListViewModel
    let selectedSong: Song?
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                if songsViewModel.state == .isLoading {
                    ProgressView().progressViewStyle(.circular)
                } else if songsViewModel.songs.count > 0 {
                    SongsGridView(songs: songsViewModel.songs, selectedSong: selectedSong)
                        .onAppear {
                            if let song = selectedSong {
                                withAnimation {
                                    proxy.scrollTo(song.trackNumber, anchor: .topTrailing)
                                }
                            }
                        }
                }
                
            }
        }
    }
}
#Preview {
    SongsGridView(songs: [Song.preview], selectedSong: nil)
}
