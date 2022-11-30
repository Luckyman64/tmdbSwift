//
//  StarView.swift
//  tmdb
//
//  Created by Clement Lantiat on 09/09/1401 AP.
//

import SwiftUI

struct StarView: View {
    var movie: Movie
    @Binding var favoriteMovies: Set<Movie>
    var body: some View {
        Button(
            action: {
                if favoriteMovies.contains(movie){
                    favoriteMovies.remove(movie)
                }else{
                    favoriteMovies.insert(movie)
                }
            },
            label: {
                if favoriteMovies.contains(movie){
            Image(systemName: "heart.fill")
                .font(.largeTitle)
                }else{
                    Image(systemName: "heart")
                        .font(.largeTitle)
                }
        })
    }
}
