//
//  FavoriteView.swift
//  tmdb
//
//  Created by Clement Lantiat on 09/09/1401 AP.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var viewModel: tmdbViewModel
    var body: some View {
        NavigationView{
            List{
            MovieListView(movies: Array(viewModel.favoriteMovie), favoriteMovies: $viewModel.favoriteMovie)
                    .navigationTitle(Text("Favoris"))
            }
        }
    }
}

