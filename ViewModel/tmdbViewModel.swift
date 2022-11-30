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
    @Published var favoriteMovie : Set<Movie> = Set<Movie>(){
        didSet {
            writeFavorite()
        }
    }
    
    init() {
        readFavortite()
    }
    
    func readFavortite(){
        guard let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        else{
            return
        }
        
        let favoriteURL = documentURL.appendingPathComponent("favorite.json")
        
        do{
        let data = try Data(contentsOf: favoriteURL)
            favoriteMovie = try JSONDecoder().decode(Set<Movie>.self, from: data)
        }catch{
            print(error)
        }
    }
    
    func writeFavorite(){
        guard let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        else{
            return
        }
        
        let favoriteURL = documentURL.appendingPathComponent("favorite.json")
        
        do{
        if let data = try? JSONEncoder().encode(favoriteMovie){
            try data.write(to: favoriteURL)
        }
        }catch{
            print(error)
        }
    }
    
    let movieFetcher = MovieFetcher()
    
    func getMovies() async throws{
        let moviesResponse = try await movieFetcher.getMovies()
        movies = moviesResponse.results
    }
    
}

