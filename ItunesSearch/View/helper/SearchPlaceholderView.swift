//
//  AlbumPlaceholderView.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 19/12/2024.
//

import SwiftUI

struct SearchPlaceholderView:View {
    @Binding var searchTerm:String
    
    let suggestions: [String] = ["rammstein", "cry to me", "maneskin"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Trending").font(.title)
            ForEach(suggestions , id: \.self) { text in
                Button {
                    searchTerm = text
                } label: {
                    Text(text).font(.title2)
                }

            }
        }
    }
}

#Preview {
    SearchPlaceholderView(searchTerm: .constant("John Wick"))
}
