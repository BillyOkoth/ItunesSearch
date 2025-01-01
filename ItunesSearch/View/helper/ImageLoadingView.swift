//
//  ImageLoadingView.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 21/12/2024.
//

import SwiftUI

struct ImageLoadingView:View {
    
    let urlString: String
    let size: CGFloat?
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .empty:
                ProgressView().frame(width: size)
            case .success (let image):
                image
            case .failure:
                Color.gray.frame(width: size ,height: size)
            @unknown default:
                EmptyView()
            }
        }
    }
}
