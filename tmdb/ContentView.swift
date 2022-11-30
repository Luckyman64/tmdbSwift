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
        NavigationView{
        List{
            ForEach(viewModel.movies){movie in
                NavigationLink {
                    MovieDetailView(movie: movie, favoriteMovies : $viewModel.favoriteMovie)
                } label: {
                    MovieCell(movie:movie, favoriteMovies: $viewModel.favoriteMovie)
                }
            }
        }.navigationTitle(Text("Now Playing"))
        }
            .task {
                try? await viewModel.getMovies()
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
            
            AsyncImage(url: movie.posterURL){
                phase in
                switch phase{
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable().aspectRatio(contentMode: .fit)
                case .failure:
                    EmptyView()
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width : 100)
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

