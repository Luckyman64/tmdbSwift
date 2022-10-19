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
                VStack{
                    Text(movie.title).font(.title)
                    Text(movie.overview)
                //Text(viewModel.movie.title).font(.title)
                //Text(viewModel.movie.overview)
                
            }
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
