//
//  MovieDetailView.swift
//  tmdb
//
//  Created by Clement Lantiat on 02/09/1401 AP.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: Movie
    
    var body: some View{
        VStack{
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
            }.frame(width: 200)
            Text(movie.title)
            Text(movie.overview)
            
            NoteView(pourcent: movie.voteAverage*10)
                .frame(width: 300, height: 300)
            
            Spacer()
        }
        .padding()
    }
}

struct ArcShape: Shape{
    var percent: Double
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        var p = Path()
        
        p.addArc(center: center, radius: rect.width/2, startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: percent*3.6-90), clockwise: false)
        return p
    }
    
    
}

struct NoteView: View{
    var pourcent: Double
    var body: some View{
        GeometryReader{geometry in
            let padding = geometry.size.width/15
            let lineWidth = geometry.size.width/18
            ZStack{
                Circle()
                Circle()
                    .stroke(Color.green.opacity(0.4), lineWidth: lineWidth)
                    .padding(padding)
                ArcShape(percent: pourcent)
                    .stroke(Color.green, style : StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .padding(padding)
                    
                Text("\(Int(pourcent)) %")
                    .font(.largeTitle)
                    .colorInvert()
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let path = Bundle.main.path(forResource: "BlackAdamJson", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let movieP = try! JSONDecoder().decode(Movie.self, from: data)
        MovieDetailView(movie:movieP)
    }
}