//
//  Untitled 2.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 19/12/2024.
//

import Foundation
import Combine

@MainActor
class SongListViewModel: ObservableObject {
    
    @Published var songs: [Song] = []
    @Published var searchTerm: String = ""
    @Published var state:FetchState = .good
    
     
    let limit:Int = 20
    var page:Int = 0
    let service = APIService()
    var subscriptions = Set<AnyCancellable>()
    
    init () {
        $searchTerm
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { term  in
            Task {
                self.state = .good
                self.page = 0
                self.songs = []
                try await self.searchSongs(for : term)
            }
        }.store(in: &subscriptions)
    }
    
    
    func loadMore(){
        Task {
           try await searchSongs(for: searchTerm )
        }
    }
    
    func searchSongs(for term:String) async throws {
        
        guard !searchTerm.isEmpty else { return }
        
        guard state == FetchState.good  else { return }
        
       
        state = .isLoading
        
        let result =  await service.fetchSongs(searchTerm: searchTerm , page: page, limit: limit)
        
        switch result {
        case .success(let songResult):
            print("song results \(songResult.results.count)")
            for song in songResult.results {
                   songs.append(song)
               }
        
               page += 1
            state = (songResult.results.count == limit ? .good : .loadedAll)
        case .failure(let error):
            print("Could not decode \(error)")
            state = .error(error.localizedDescription)
        }
        state = .good
    }
    
    static func example() -> SongListViewModel{
        let vm = SongListViewModel()
        vm.songs = [Song.preview]
        return vm 
    }
    
}


    
   
