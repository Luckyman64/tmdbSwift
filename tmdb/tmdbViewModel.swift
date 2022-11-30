//
//  tmdbViewModel.swift
//  tmdb
//
//  Created by Clement Lantiat on 27/07/1401 AP.
//

import SwiftUI

@MainActor
class tmdbViewModel: ObservableObject{
    @Published var movies = [Movie]()
    @Published var favoriteMovie : Set<Movie> = Set<Movie>()
    
    let movieFetcher = MovieFetcher()
    
    func getMovies() async throws{
        let moviesResponse = try await movieFetcher.getMovies()
        movies = moviesResponse.results
    }
    
}

