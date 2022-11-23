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
        List{
            ForEach(viewModel.movies.results){movie in
                HStack{
                    
                    AsyncImage(url: movie.backdropURL){
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
                    VStack(alignment: .center){
                        Text(movie.title).font(.title).lineLimit(1)
                    Text(movie.overview).lineLimit(3)
                    }
                }
                   
                //Text(viewModel.movie.title).font(.title)
                //Text(viewModel.movie.overview)
            .padding()
            .task {
                await viewModel.getMovies()
            }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


