//
//  MovieFetcher.swift
//  tmdb
//
//  Created by Clement Lantiat on 27/07/1401 AP.
//

import Foundation

class MovieFetcher{
    let url = URL(string : "https://api.themoviedb.org/3/movie/550?api_key=c15a319ea46106ff5e1547059a870c14")!
    
    func getMovie()async throws-> Movie{
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let jsonDecoder = JSONDecoder()
        let movie = try jsonDecoder.decode(Movie.self, from: data)
        return movie
    }
    
}
