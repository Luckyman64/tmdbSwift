//
//  MovieFetcher.swift
//  tmdb
//
//  Created by Clement Lantiat on 27/07/1401 AP.
//

import Foundation

class MovieFetcher{
    
    let jsonDecoder = JSONDecoder()
    
    let moviesURLString = "https://api.themoviedb.org/3/movie/now_playing?api_key=c15a319ea46106ff5e1547059a870c14&language=fr"
    
    func getMovies(page: Int)async throws -> Movies{
        let movieURL = URL(string: moviesURLString + "&page=\(page)")!
        let request = URLRequest(url: movieURL)
        let (data, _) = try await URLSession.shared.data(for: request)
        let movies = try jsonDecoder.decode(Movies.self, from: data)
        return movies
    }
    
}
