//
//  MovieViewModel.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 18/12/2024.
//

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


@MainActor
class MovieListViewModel: ObservableObject {
    
    
    @Published var movies: [Movie] = []
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
                self.movies = []
                try await self.searchMovies(for : term)
            }
        }.store(in: &subscriptions)
    }
    
    
    func loadMore(){
        Task {
           try await searchMovies(for: searchTerm )
        }
    }
    
    func searchMovies(for term:String) async throws {
        
        guard !searchTerm.isEmpty else { return }
        
        guard state == FetchState.good  else { return }
        
        state = .isLoading
        
        let a = await service.fetchMovies(searchTerm: searchTerm , page: page , limit: limit)
        switch a {
        case .success(let movieResults):
            for movie in movieResults.results {
                if !movies.contains(movie) {
                    movies.append(movie)
                }
            }
            page += 1
            state = (movieResults.results.count == limit ? .good : .loadedAll)
        case .failure(let error):
            print("couldnt fetch movies \(error)")
            state = .error(error.localizedDescription)
        }
        state = .good
    }
    
    static func example() -> MovieListViewModel{
        let vm = MovieListViewModel()
        vm.movies = [Movie.preview]
        return vm
    }

}

    
   
