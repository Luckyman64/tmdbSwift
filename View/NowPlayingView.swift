//
//  NowPlayingView.swift
//  tmdb
//
//  Created by Clement Lantiat on 09/09/1401 AP.
//

import SwiftUI

struct NowPlayingView: View {
    @StateObject var viewModel:tmdbViewModel
    var body: some View {
        NavigationView{
            MovieListView(movies: viewModel.movies, favoriteMovies: $viewModel.favoriteMovie)
                .navigationTitle(Text("Now Playing"))
        }
            .task {
                try? await viewModel.getMovies()
            }
    }
}
