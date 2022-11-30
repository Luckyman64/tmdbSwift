//
//  MovieListView.swift
//  tmdb
//
//  Created by Clement Lantiat on 09/09/1401 AP.
//

import SwiftUI

struct MovieListView: View {
    var movies: [Movie]
    @Binding var favoriteMovies: Set<Movie>
    var body: some View {
        List{
            ForEach(movies){movie in
                NavigationLink {
                    MovieDetailView(movie: movie, favoriteMovies : $favoriteMovies)
                } label: {
                    MovieCell(movie:movie, favoriteMovies: $favoriteMovies)
                }
            }
        }
    }
}
