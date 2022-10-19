//
//  MovieFetcher.swift
//  tmdb
//
//  Created by Clement Lantiat on 27/07/1401 AP.
//

import Foundation

class MovieFetcher{
    func getMovie(completionHandler: @escaping (Movie?) -> ()){

        let url = URL(string : "https://api.themoviedb.org/3/movie/550?api_key=c15a319ea46106ff5e1547059a870c14")!

        let dataTask = URLSession.shared.dataTask(with: url){ data, response, error in

            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let movie = try jsonDecoder.decode(Movie.self, from: data)
                    print(movie)
                    DispatchQueue.main.async {
                        completionHandler(movie)
                    }
                } catch let error{
                    print(error)
                }
            }

        }

        dataTask.resume()
    }
}
