//
//  tmdbViewModel.swift
//  tmdb
//
//  Created by Clement Lantiat on 27/07/1401 AP.
//

import SwiftUI

@MainActor
class tmdbViewModel: ObservableObject{
    @Published var movie = Movie(id: 0, title: "", overview: "", backdropPath: "", posterPath: "")
    @Published var movies = Movies(page: 0, results: [Movie(id: 0, title: "", overview: "", backdropPath: "", posterPath: "")])
    
    let movieFetcher = MovieFetcher()
    
    func getMovie() async {
        do{
        movie  =  try await movieFetcher.getMovie()
        } catch{
            movie = Movie(id: 0, title: "", overview: "", backdropPath: "", posterPath: "")
        }
    }
    
    func getMovies() async{
        do{
            movies = try await movieFetcher.getMovies()
        }catch{
            movies = Movies(page: 0, results: [Movie(id: 0, title: "", overview: "", backdropPath: "", posterPath: "")])
        }
    }
    
}

