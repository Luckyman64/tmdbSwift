//
//  tmdbViewModel.swift
//  tmdb
//
//  Created by Clement Lantiat on 27/07/1401 AP.
//

import SwiftUI

class tmdbViewModel: ObservableObject{
    @Published var movie = Movie(id: 0, title: "", overview: "", backdropPath: "")
    
    let movieFetcher = MovieFetcher()
    
    func getMovie(){
        movieFetcher.getMovie(completionHandler: { movie in
            if let movie = movie{
                self.movie = movie
            }
        })
    }
    
}

