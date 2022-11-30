//
//  MovieFetcher.swift
//  tmdb
//
//  Created by Clement Lantiat on 27/07/1401 AP.
//

import Foundation

class MovieFetcher{
    let url2 = URL(string : "https://api.themoviedb.org/3/movie/now_playing?api_key=c15a319ea46106ff5e1547059a870c14&language=fr")!
    
    let jsonDecoder = JSONDecoder()
    
    func getMovies()async throws -> Movies{
        let request = URLRequest(url: url2)
        let (data, _) = try await URLSession.shared.data(for: request)
        let movies = try jsonDecoder.decode(Movies.self, from: data)
        return movies
    }
    
}
