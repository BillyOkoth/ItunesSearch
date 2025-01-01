//
//  State.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 23/12/2024.
//


enum FetchState:Comparable {
        case good ,isLoading ,loadedAll , error(String)
    }
