//
//  EntityType.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 19/12/2024.
//
import Foundation

enum EntityType: String, CaseIterable ,Identifiable {
        case all
        case album
        case song
        case movie
        
        var id : String {
            self.rawValue
        }
        
        func name () -> String {
           switch self {
               case .all:
                   return "All"
               case .album:
                   return "Albums"
               case .song:
                   return "Songs"
               case .movie:
                   return "Movies"
                }
        }
    }
