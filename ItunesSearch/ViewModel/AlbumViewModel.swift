//
//  AlbumViewModel.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 17/12/2024.
//


//https://itunes.apple.com/search?term=jack+johnson
// https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10
// https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=5
// https://itunes.apple.com/search?term=jack+johnson&entity=movie&limit=5


import Foundation
import Combine

class AlbumViewModel: ObservableObject {
    
    enum State:Comparable {
        case good ,isLoading ,loadedAll , error(String)
    }
    
    @Published var albums: [Album] = []
    @Published var searchTerm: String = ""
    @Published var state:State = .good {
        didSet {
            print("state changed to  \(state)")
        }
    }
    
     
    let limit:Int = 20
    var page:Int = 0
    
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
        
        guard state == State.good  else { return }
        
        let offset = page * limit
        let url = URL(string: "https://itunes.apple.com/search?term=\(term)&entity=album&limit=\(limit)&offset=\(offset)")!
        
        print("start fetching data fro \(searchTerm)")
        state = .isLoading
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        do {
            let albumResult = try decoder.decode(AlbumResult.self, from: data)
            for album in albumResult.results {
                albums.append(album)
            }
            page += 1
            state = (albumResult.results.count == limit ? .good : .loadedAll)
          
        } catch {
            state = .error("Counldn't decode , \(error.localizedDescription)")
        }
        state = .good
        
    }
}

    
   
