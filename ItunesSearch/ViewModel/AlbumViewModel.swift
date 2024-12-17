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
    @Published var albums: [Album] = []
    @Published var searchTerm: String = ""
     
    let limit:Int = 20
    var subscriptions = Set<AnyCancellable>()
    
    init () {
        $searchTerm
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { term  in
            Task {
                try await self.searchAlbums(term: term)
            }
        }.store(in: &subscriptions)
    }
    
    
    func searchAlbums(term:String) async throws {
        let url = URL(string: "https://itunes.apple.com/search?term=\(term)&entity=album&limit=\(limit)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        do {
            let albumResult = try decoder.decode(AlbumResult.self, from: data)
            albums = albumResult.results
            print("called")
        } catch {
            print(error)
        }
    }
}

    
   
