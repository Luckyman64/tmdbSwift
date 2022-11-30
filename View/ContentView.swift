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


