import Foundation

// MARK: - SongResult
struct SongResult: Codable{
    let resultCount: Int
    let results: [Song]
}

// MARK: - Song
struct Song: Codable ,Identifiable {
    let wrapperType:String
    let kind: String?
    let artistID, collectionID: Int
    let id: Int
    let artistName, collectionName, trackName, collectionCensoredName: String
    let trackCensoredName: String
    let artistViewURL, collectionViewURL, trackViewURL: String
    let previewURL: String
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let collectionPrice, trackPrice: Double?
    let releaseDate:String
    let collectionExplicitness, trackExplicitness: String
    let discNumber, trackCount, trackNumber: Int
    let trackTimeMillis: Int
    let country, currency, primaryGenreName: String
    let collectionArtistName: String?
    
    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case id = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, collectionArtistName
    }
//    https://youtu.be/QFQSrBsYxmU?list=PLWHegwAgjOkq_7d4Nz_FxWfAiBFGfK8OY&t=2257
    init(wrapperType: String, kind: String, artistID: Int, collectionID: Int, id: Int, artistName: String, collectionName: String, trackName: String, collectionCensoredName: String, trackCensoredName: String, artistViewURL: String, collectionViewURL: String, trackViewURL: String, previewURL: String, artworkUrl30: String, artworkUrl60: String, artworkUrl100: String, collectionPrice: Double?, trackPrice: Double?, releaseDate: String, collectionExplicitness: String, trackExplicitness: String, discNumber: Int, trackCount: Int, trackNumber: Int, trackTimeMillis: Int, country: String, currency: String, primaryGenreName: String, collectionArtistName: String?) {
        self.wrapperType = wrapperType
        self.kind = kind
        self.artistID = artistID
        self.collectionID = collectionID
        self.id = id
        self.artistName = artistName
        self.collectionName = collectionName
        self.trackName = trackName
        self.collectionCensoredName = collectionCensoredName
        self.trackCensoredName = trackCensoredName
        self.artistViewURL = artistViewURL
        self.collectionViewURL = collectionViewURL
        self.trackViewURL = trackViewURL
        self.previewURL = previewURL
        self.artworkUrl30 = artworkUrl30
        self.artworkUrl60 = artworkUrl60
        self.artworkUrl100 = artworkUrl100
        self.collectionPrice = collectionPrice
        self.trackPrice = trackPrice
        self.releaseDate = releaseDate
        self.collectionExplicitness = collectionExplicitness
        self.trackExplicitness = trackExplicitness
        self.discNumber = discNumber
        self.trackCount = trackCount
        self.trackNumber = trackNumber
        self.trackTimeMillis = trackTimeMillis
        self.country = country
        self.currency = currency
        self.primaryGenreName = primaryGenreName
        self.collectionArtistName = collectionArtistName
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.wrapperType = try container.decode(String.self, forKey: .wrapperType)
        self.kind = try container.decodeIfPresent(String.self, forKey: .kind) ?? ""
        self.artistID = try container.decode(Int.self, forKey: .artistID)
        self.collectionID = try container.decode(Int.self, forKey: .collectionID)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.artistName = try container.decode(String.self, forKey: .artistName)
        self.collectionName = try container.decode(String.self, forKey: .collectionName)
        self.trackName = try container.decodeIfPresent(String.self, forKey: .trackName) ?? ""
        self.collectionCensoredName = try container.decode(String.self, forKey: .collectionCensoredName)
        self.trackCensoredName = try container.decodeIfPresent(String.self, forKey: .trackCensoredName) ?? ""
        self.artistViewURL = try container.decodeIfPresent(String.self, forKey: .artistViewURL) ?? ""
        self.collectionViewURL = try container.decode(String.self, forKey: .collectionViewURL)
        self.trackViewURL = try container.decodeIfPresent(String.self, forKey: .trackViewURL) ?? ""
        self.previewURL = try container.decodeIfPresent(String.self, forKey: .previewURL) ?? ""
        self.artworkUrl30 = try container.decodeIfPresent(String.self, forKey: .artworkUrl30) ?? ""
        self.artworkUrl60 = try container.decodeIfPresent(String.self, forKey: .artworkUrl60) ?? ""
        self.artworkUrl100 = try container.decodeIfPresent(String.self, forKey: .artworkUrl100) ?? ""
        self.collectionPrice = try container.decodeIfPresent(Double.self, forKey: .collectionPrice)
        self.trackPrice = try container.decodeIfPresent(Double.self, forKey: .trackPrice)
        self.releaseDate = try container.decode(String.self, forKey: .releaseDate)
        self.collectionExplicitness = try container.decode(String.self, forKey: .collectionExplicitness)
        self.trackExplicitness = try container.decodeIfPresent(String.self, forKey: .trackExplicitness) ?? ""
        self.discNumber = try container.decodeIfPresent(Int.self, forKey: .discNumber) ?? 0
        self.trackCount = try container.decode(Int.self, forKey: .trackCount)
        self.trackNumber = try container.decodeIfPresent(Int.self, forKey: .trackNumber) ?? 0
        self.trackTimeMillis = try container.decodeIfPresent(Int.self, forKey: .trackTimeMillis) ?? 0
        self.country = try container.decode(String.self, forKey: .country)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.primaryGenreName = try container.decode(String.self, forKey: .primaryGenreName)
        self.collectionArtistName = try container.decodeIfPresent(String.self, forKey: .collectionArtistName)
    }
    
}



extension Song {
    static let preview = Song(wrapperType: "track", kind: "song", artistID: 909253, collectionID:255144028, id: 255145362, artistName: "Jack Johnson", collectionName: "Instant Karma: The Amnesty International Campaign to Save Darfur", trackName: "Imagine", collectionCensoredName: "Instant Karma: The Amnesty International Campaign to Save Darfur", trackCensoredName:"Imagine", artistViewURL: "https://music.apple.com/us/artist/jack-johnson/909253?uo=4", collectionViewURL: "https://music.apple.com/us/album/imagine/255144028?i=255145362&uo=4", trackViewURL: "https://music.apple.com/us/album/imagine/255144028?i=255145362&uo=4", previewURL: "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/ec/6c/66/ec6c66ab-5f0b-0fcd-a653-cd9f7eb759c8/mzaf_14209309209223301447.plus.aac.p.m4a", artworkUrl30: "https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/7b/80/e7/7b80e7c7-edfe-73f6-0c91-e332173020de/mzi.dypfgiki.jpg/30x30bb.jpg", artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/7b/80/e7/7b80e7c7-edfe-73f6-0c91-e332173020de/mzi.dypfgiki.jpg/60x60bb.jpg", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/7b/80/e7/7b80e7c7-edfe-73f6-0c91-e332173020de/mzi.dypfgiki.jpg/100x100bb.jpg", collectionPrice: 19.99, trackPrice: 1.29, releaseDate: "2007-06-11T12:00:00Z", collectionExplicitness: "explicit", trackExplicitness: "notExplicit", discNumber: 1, trackCount: 34, trackNumber: 15, trackTimeMillis: 219080, country: "USA", currency: "USD", primaryGenreName: "Rock", collectionArtistName: "Various Artists")
}
