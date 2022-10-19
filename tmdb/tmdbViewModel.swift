//
//  tmdbViewModel.swift
//  tmdb
//
//  Created by Clement Lantiat on 27/07/1401 AP.
//

import SwiftUI

class tmdbViewModel: ObservableObject{
    @Published var movie = Movie(id: 0, title: "", overview: "", backdropPath: "")
    
    func getMovie(){
        let api = "c15a319ea46106ff5e1547059a870c14"

        let url = URL(string : "https://api.themoviedb.org/3/movie/550?api_key=" + api)!

        let dataTask = URLSession.shared.dataTask(with: url){
            data, response, error in

            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let movie = try jsonDecoder.decode(Movie.self, from: data)
                    print(movie)
                    DispatchQueue.main.async {
                        self.movie = movie
                    }
                } catch let error{
                    print(error)
                }
            }

        }

        dataTask.resume()
    }
}

