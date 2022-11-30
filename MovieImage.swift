//
//  MovieImage.swift
//  tmdb
//
//  Created by Clement Lantiat on 09/09/1401 AP.
//

import SwiftUI

struct MovieImage: View {
    var movieURL: URL
    var body: some View {
        AsyncImage(url: movieURL){
            phase in
            switch phase{
            case .empty:
                ZStack{
                    Color.clear
                    ProgressView()
                }
            case .success(let image):
                image.resizable().aspectRatio(contentMode: .fit)
            case .failure:
                Color.clear
            @unknown default:
                Color.clear
            }
        }
    }
}

