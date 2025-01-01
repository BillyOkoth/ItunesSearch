//
//  APIError.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 18/12/2024.
//
import Foundation

enum APIError: Error, CustomStringConvertible {
    
    case badURL
    case urlSession(URLError?)
    case badResponse
    case decoding(DecodingError?)
    case unknown
    
    var description: String {
        switch self {
            case .badURL:
                return "badURL"
            case .urlSession(let error):
                return "urlSession error: \(error.debugDescription)"
            case .badResponse:
                return "bad response with status code"
            case .decoding(let decodingError):
                return "decoding error: \(String(describing: decodingError))"
            case .unknown:
                return "unknown error"
        }
    }
    
    var localizedDescription: String {
        switch self {
            case .badURL, .unknown:
               return "This is a bad url"
            case .urlSession(let urlError):
                return urlError?.localizedDescription ?? "something went wrong"
            case .badResponse :
                return "something went wrong"
            case .decoding(let decodingError):
                return decodingError?.localizedDescription ?? "something went wrong "
        }
    }
}
