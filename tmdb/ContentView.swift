//
//  ContentView.swift
//  tmdb
//
//  Created by Clement Lantiat on 27/07/1401 AP.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = tmdbViewModel()
    
    var body: some View {
        TabView{
            NowPlayingView(viewModel: viewModel)
            .tabItem{
                Label("Now Playing", systemImage: "play.rectangle")
            }
            FavoriteView(viewModel: viewModel)
                .tabItem{
                    Label("Favoris", systemImage: "heart")
                }
            }
        }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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

