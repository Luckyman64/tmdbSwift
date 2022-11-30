//
//  MovieCell.swift
//  tmdb
//
//  Created by Clement Lantiat on 09/09/1401 AP.
//

import SwiftUI

struct MovieCell: View{
    var movie: Movie
    @Binding var favoriteMovies: Set<Movie>
    
    var body : some View{
        HStack{
            if let url = movie.posterURL{
            MovieImage(movieURL: url)
            .frame(width : 100)
            }
            VStack(alignment: .leading){
                HStack{
                    Text(movie.title).font(.title2).lineLimit(1)
                    Spacer()
                    StarView(movie: movie, favoriteMovies: $favoriteMovies)
                }
                Text(movie.overview).lineLimit(3)
                
            }
        }
    }
}


