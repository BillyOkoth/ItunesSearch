//
//  ContentView.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 17/12/2024.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
       
        TabView {
            SearchView().tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            AlbumSearchView().tabItem {
                Label("Albums", systemImage: "music.note")
            }
            MovieSearchView().tabItem {
                Label("Movies", systemImage: "tv")
            }
            
        }
    }
}

#Preview {
    NavigationView {
        ContentView()
    }
}
