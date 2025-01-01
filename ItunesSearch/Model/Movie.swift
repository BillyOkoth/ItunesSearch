//
//  Moview.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 17/12/2024.
//
import Foundation

// MARK: - MovieResult
struct MovieResult: Codable {
    let resultCount: Int
    let results: [Movie]
}

// MARK: - Result
struct Movie: Codable, Identifiable ,Hashable {
    let wrapperType, kind: String
      let artistID: Int?
      let trackID: Int
      let artistName, trackName, trackCensoredName: String
      let artistViewURL: String?
      let trackViewURL: String
      let previewURL: String?
      let artworkUrl30, artworkUrl60, artworkUrl100: String
      let collectionPrice: Double?
      let trackPrice: Double?
      let trackRentalPrice, collectionHDPrice, trackHDPrice, trackHDRentalPrice: Double?
      let releaseDate: String
      let collectionExplicitness, trackExplicitness: String
      let trackTimeMillis: Int?
      let country, currency, primaryGenreName, contentAdvisoryRating: String
      let shortDescription: String?
      let longDescription: String?
      
      var id: Int {
          return trackID
      }
    
    enum CodingKeys: String, CodingKey {
           case wrapperType, kind
           case artistID = "artistId"
           case trackID = "trackId"
           case artistName, trackName, trackCensoredName
           case artistViewURL = "artistViewUrl"
           case trackViewURL = "trackViewUrl"
           case previewURL = "previewUrl"
           case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
           case collectionHDPrice = "collectionHdPrice"
           case trackHDPrice = "trackHdPrice"
           case trackHDRentalPrice = "trackHdRentalPrice"
           case releaseDate, collectionExplicitness, trackExplicitness, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription
       }
}

extension Movie {
    static var preview = Movie(wrapperType: "track", kind: "feature-movie", artistID: 1487135503, trackID: 1487135503, artistName: "Jack Johnson", trackName: "All At Once: On the Road Tour Documentary", trackCensoredName: "All At Once: On the Road Tour Documentary", artistViewURL: "https://music.apple.com/us/artist/jack-johnson/909253?uo=4", trackViewURL: "https://itunes.apple.com/us/movie/all-at-once-on-the-road-tour-documentary/id1487135503?uo=4", previewURL: "https://video-ssl.itunes.apple.com/itunes-assets/Video111/v4/a8/e5/19/a8e5199c-df7e-7ff1-6c87-0bc4db95a201/mzvf_2579342668513896153.640x476.h264lc.U.p.m4v", artworkUrl30: "https://is1-ssl.mzstatic.com/image/thumb/Video3/v4/80/1d/47/801d4725-5070-1e2a-ab32-dbb240ee8390/UMG_vidcvr_00602547849786_01_RGB72_1400x2100_16UMGIM10177.jpg/30x30bb.jpg", artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Video3/v4/80/1d/47/801d4725-5070-1e2a-ab32-dbb240ee8390/UMG_vidcvr_00602547849786_01_RGB72_1400x2100_16UMGIM10177.jpg/60x60bb.jpg", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Video3/v4/80/1d/47/801d4725-5070-1e2a-ab32-dbb240ee8390/UMG_vidcvr_00602547849786_01_RGB72_1400x2100_16UMGIM10177.jpg/100x100bb.jpg", collectionPrice: 7.99, trackPrice: 7.99, trackRentalPrice: 3.99, collectionHDPrice: 9.99, trackHDPrice: 9.99, trackHDRentalPrice: 4.99, releaseDate: "2016-04-08T07:00:00Z", collectionExplicitness: "notExplicit", trackExplicitness: "notExplicit", trackTimeMillis: 2472388, country: "USA", currency: "USD", primaryGenreName: "Concert Films", contentAdvisoryRating: "NR", shortDescription: "This film takes an intimate look at Jack Johnson’s music and tour greening initiatives. When Jack", longDescription: "This film takes an intimate look at Jack Johnson’s music and tour greening initiatives. When Jack goes on the road, he doesn’t just show up and play music. The tour partners with local non-profits, local food vendors and strives to leave a lasting positive impact. The entire tour is an extension of the environmentally conscious and socially engaged life he leads along with his wife, Kim. After years on the road, playing venues around the globe, the Johnson’s have established an inspiring way of touring with a focus on creating as little impact on the earth as possible. Along the way, the tour gives a platform to dozens of local non-profits working to educate and inspire others to make choices that benefit our communities and the greater global environment. While following Jack’s 2014 west coast tour, this film highlights the Johnson‘s Kokua Hawaii Foundation, the All At Once campaign, and several non-profit partners and businesses focusing on plastic free initiatives and sustainable local food systems. Additionally, the film highlights the unique way in which tour is run. From traveling on biodiesel-powered buses, to sourcing organic and locally grown meals to carefully disposing of waste created along the way. The goal of the tour and this documentary is to inspire people to get involved, make the right choices, and enjoy the music along the way.")
    
    
    static var preview2 = Movie(wrapperType: "track", kind: "feature-movie", artistID: nil, trackID: 586187595, artistName: "Ang Lee", trackName: "Life of Pi", trackCensoredName: "Life of Pi", artistViewURL: nil, trackViewURL: "https://itunes.apple.com/us/movie/life-of-pi/id586187595?uo=4", previewURL: Optional("https://video-ssl.itunes.apple.com/itunes-assets/Video118/v4/92/c7/ef/92c7ef9a-32be-7895-afb8-6751f9e52186/mzvf_6648512173930020645.640x480.h264lc.U.p.m4v"), artworkUrl30: "https://is1-ssl.mzstatic.com/image/thumb/Video49/v4/fc/c1/cc/fcc1cc49-6c35-2527-392c-d2eb433ff8db/pr_source.lsr/30x30bb.jpg", artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Video49/v4/fc/c1/cc/fcc1cc49-6c35-2527-392c-d2eb433ff8db/pr_source.lsr/60x60bb.jpg", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Video49/v4/fc/c1/cc/fcc1cc49-6c35-2527-392c-d2eb433ff8db/pr_source.lsr/100x100bb.jpg", collectionPrice: Optional(4.99), trackPrice: Optional(4.99), trackRentalPrice: Optional(3.99), collectionHDPrice: Optional(4.99), trackHDPrice: Optional(4.99), trackHDRentalPrice: Optional(3.99), releaseDate: "2012-11-21T08:00:00Z", collectionExplicitness: "notExplicit", trackExplicitness: "notExplicit", trackTimeMillis: Optional(7642675), country: "USA", currency: "USD", primaryGenreName: "Drama", contentAdvisoryRating: "PG", shortDescription: nil, longDescription: Optional("Embark on the adventure of a lifetime in this visual masterpiece from Oscar® Winner Ang Lee (Directing, Brokeback Mountain, 2005), based on the best-selling novel. After a cataclysmic shipwreck, young Pi Patel finds himself stranded on a lifeboat with only one other survivor – a ferocious Bengal tiger named Richard Parker. Bound by the need to survive, the two are cast on an epic journey that must be seen to be believed."))
}











