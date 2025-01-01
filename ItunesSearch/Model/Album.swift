//
//  Album.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 17/12/2024.
//


import Foundation

// MARK: - AlbumResult
struct AlbumResult: Codable {
    let resultCount: Int
    let results: [Album]
}

// MARK: - Result
struct Album: Codable,Identifiable {
    let wrapperType, collectionType: String
        let id: Int
        let artistID: Int
        let amgArtistID: Int?
        let artistName, collectionName, collectionCensoredName: String
        let artistViewURL: String?
        let collectionViewURL: String
        let artworkUrl60, artworkUrl100: String
        let collectionPrice: Double?
        let collectionExplicitness: String
        let trackCount: Int
        let copyright: String?
        let country, currency: String
        let releaseDate: String
        let primaryGenreName: String


    enum CodingKeys: String, CodingKey {
        case wrapperType, collectionType
        case artistID = "artistId"
        case id = "collectionId"
        case amgArtistID = "amgArtistId"
        case artistName, collectionName, collectionCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case artworkUrl60, artworkUrl100, collectionPrice, collectionExplicitness, trackCount, copyright, country, currency, releaseDate, primaryGenreName
    }
}


extension Album {
    static var preview = Album (wrapperType: "collection", collectionType: "Album", id: 1469577723, artistID: 909253, amgArtistID: 468749, artistName: "Jack Johnson", collectionName: "Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George", collectionCensoredName: "Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George", artistViewURL: "https://music.apple.com/us/artist/jack-johnson/909253?uo=4", collectionViewURL: "https://music.apple.com/us/album/jack-johnson-and-friends-sing-a-longs-and/1469577723?uo=4", artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/08/11/d2/0811d2b3-b4d5-dc22-1107-3625511844b5/00602537869770.rgb.jpg/60x60bb.jpg", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/08/11/d2/0811d2b3-b4d5-dc22-1107-3625511844b5/00602537869770.rgb.jpg/100x100bb.jpg", collectionPrice: 9.99, collectionExplicitness: "notExplicit", trackCount: 15, copyright: "℗ 2014 Brushfire Records", country: "USA", currency: "USD", releaseDate: "2006-02-07T08:00:00Z", primaryGenreName: "Rock")
}
