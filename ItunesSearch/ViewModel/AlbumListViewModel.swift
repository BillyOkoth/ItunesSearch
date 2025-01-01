//
//  AlbumViewModel.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 17/12/2024.
//


//https://itunes.apple.com/search?term=jack+johnson
// https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10
// https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=5&offset=10
// https://itunes.apple.com/search?term=jack+johnson&entity=movie&limit=5


import Foundation
import Combine

@MainActor
class AlbumListViewModel: ObservableObject {
    
    @Published var albums: [Album] = []
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
                self.albums = []
                try await self.searchAlbums(for : term)
            }
        }.store(in: &subscriptions)
    }
    
    
    func loadMore(){
        Task {
           try await searchAlbums(for: searchTerm )
        }
    }
    func searchAlbums(for term:String) async throws {
        
        guard !searchTerm.isEmpty else { return }
        
        guard state == FetchState.good  else { return }
        
       
        state = .isLoading
        
        let result =  await service.fetchAlbums(searchTerm: searchTerm , page: page, limit: limit)
        
        switch result {
                case .success(let albumResult):
                    for album in albumResult.results {
                           albums.append(album)
                       }
                       page += 1
                       state = (albumResult.results.count == limit ? .good : .loadedAll)
                case .failure(let error):
                    state = .error(error.localizedDescription)
                }
       
        state = .good
        
    }
    
    static func example() -> AlbumListViewModel {
        let vm = AlbumListViewModel()
        vm.albums = [Album.preview]
        return vm
    }
    
}




    
   
