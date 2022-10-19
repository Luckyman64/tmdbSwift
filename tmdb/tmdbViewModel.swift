//
//  tmdbViewModel.swift
//  tmdb
//
//  Created by Clement Lantiat on 27/07/1401 AP.
//

import SwiftUI

@MainActor
class tmdbViewModel: ObservableObject{
    @Published var movie = Movie(id: 0, title: "", overview: "", backdropPath: "")
    
    let movieFetcher = MovieFetcher()
    
    
    func getMovie() async {
        do{
        movie  =  try await movieFetcher.getMovie()
        } catch{
            movie = Movie(id: 0, title: "", overview: "", backdropPath: "")
        }
    }
    
}

