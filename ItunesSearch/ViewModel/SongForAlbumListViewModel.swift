//
//  SongForAlbumListViewModel.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 23/12/2024.
//
import SwiftUI

@MainActor

class SongForAlbumListViewModel:ObservableObject {
    let albumId:Int
    @Published  var songs = [Song]()
    @Published var state: FetchState = .good
       
    private let service = APIService()
    
    init(albumId: Int) {
        self.albumId = albumId
    }
    
        
    func fetch()  {
        Task {
            try await fetchSongs(for: albumId)
        }
       }
    
    private func fetchSongs(for albumId:Int) async throws{
        guard state == FetchState.good  else { return }
        
        state = .isLoading
        
        let result =  await service.fetchSongs(for: albumId)
        
        switch result {
            case .success(let songResult):
            var songs = songResult.results
            print("songs fetched successfully \(songs)")
            if songResult.resultCount > 0 {
                _ = songs.removeFirst()
            }
            self.songs = songs
            state = .good
            print("songs fetched successfully \(songs.count)")
            case .failure(let error):
                print("Could not decode \(error)")
                state = .error(error.localizedDescription)
            }
    }
    
    static func example() -> SongForAlbumListViewModel {
        let vm = SongForAlbumListViewModel(albumId: 1)
        vm.songs = [Song.preview , Song.preview]
        return vm
    }
}

