//
//  SongsForAlbumListView.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 24/12/2024.
//
import SwiftUI

@MainActor
class AlbumForSongViewModel: ObservableObject {
    @Published var album: Album?
    @Published var state: FetchState = .good

    let service = APIService()

    func fetch(for song: Song) {
        Task {
            try await fetchAlbum(for: song)
        }
    }

    func fetchAlbum(for song: Song) async throws {
        guard state == FetchState.good else { return }

        state = .isLoading

        let result = await service.fetchAlbum(albumId: song.collectionID)

        switch result {
        case .success(let albumResult):
            let result = albumResult.results
            album = result.first
            state = .good
        case .failure(let error):
            print("Could not decode \(error)")
            state = .error(error.localizedDescription)
        }

    }

}
