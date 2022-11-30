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
            List{
            MovieListView(movies: viewModel.movies, favoriteMovies: $viewModel.favoriteMovie)
                .navigationTitle(Text("Now Playing"))
                ProgressView()
                    .onAppear{
                    Task {
                        try? await viewModel.getMovies()
                    }
                }
            }
        }
    }
}
