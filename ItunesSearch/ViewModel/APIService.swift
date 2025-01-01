//
//  APIService.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 18/12/2024.
//

import Foundation

class APIService {
    
    
    func fetchMovies(searchTerm:String,page:Int , limit:Int) async -> Result<MovieResult , APIError> {
        let url = createUrl(for: searchTerm, type: .movie ,limit: nil, page: nil)
        return await self.getItems(type: MovieResult.self, url: url)
    }
    
    func fetchAlbums(searchTerm:String, page:Int , limit:Int) async -> Result<AlbumResult , APIError> {
        let url = createUrl(for: searchTerm, type: .album ,limit: limit, page: page)
        return await self.getItems(type: AlbumResult.self, url: url)
    }
    
    func fetchAlbum(albumId:Int) async -> Result<AlbumResult , APIError> {
        let url = createUrl(for: albumId, type: .album)
        return await self.getItems(type: AlbumResult.self, url: url)
    }
    
    func fetchSongs(for id: Int) async -> Result<SongResult , APIError> {
        let url = createUrl(for: id, type: .song)
        return await self.getItems(type: SongResult.self, url: url)
    }
    
    func fetchSongs(searchTerm:String ,page:Int , limit:Int) async -> Result<SongResult , APIError> {
        let url = createUrl(for: searchTerm, type: .song ,limit: limit, page: page)
        return await self.getItems(type: SongResult.self, url: url)
    }
    
    fileprivate func createUrl( for searchTerm:String , type:EntityType , limit:Int?, page:Int?) -> URL?  {
        let baseUrl = "https://itunes.apple.com/search"
        
        var queryItems: [URLQueryItem] = [
            URLQueryItem(name: "term", value: searchTerm),
            URLQueryItem(name: "entity", value: type.rawValue),
        ]
        
        if let page = page  ,let limit = limit {
            let offset = page * limit
            queryItems.append(URLQueryItem(name: "limit", value: String(limit)))
            queryItems.append(URLQueryItem(name: "offset", value: String(offset)))
        }
        
        var components = URLComponents(string: baseUrl)!
        components.queryItems = queryItems
        return components.url
    }
    
    // https://itunes.apple.com/lookup?id=909253&entity=song
    func createUrl( for id:Int , type:EntityType ) -> URL?  {
        let baseUrl = "https://itunes.apple.com/lookup"
        
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "id", value: String(id)),
            URLQueryItem(name: "entity", value: type.rawValue),
        ]
        
        var components = URLComponents(string: baseUrl)!
        components.queryItems = queryItems
        return components.url
    }
        
     
    func getItems<T:Decodable>( type: T.Type ,url:URL?) async -> Result<T, APIError>{
        let request = URLRequest(url: url!)
        
        do {
            let (data ,response) = try await  URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse ,httpResponse.statusCode == 200 else {
                return .failure(.badResponse)
            }
            do {
                let decoder = JSONDecoder()
                let items = try decoder.decode(T.self , from: data)
                return .success(items)
                
            } catch  let error{
                return .failure(APIError.decoding(error as? DecodingError))
            }
            
        } catch let error {
            return .failure(APIError.urlSession(error as? URLError))
        }
    }
    
   
    
}
