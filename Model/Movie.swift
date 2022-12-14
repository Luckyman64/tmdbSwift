//
//  Movie.swift
//  tmdb
//
//  Created by Clement Lantiat on 27/07/1401 AP.
//

import Foundation
import SwiftUI



struct Movie{
    let id : Int
    let title : String
    let overview : String
    let backdropPath : String?
    let posterPath: String?
    let voteAverage : Double
    
    let baseURL = "https://image.tmdb.org/t/p/w500"
    var posterURL:URL? {
        guard let posterPath = posterPath else {
            return nil
        }
            return URL(string : baseURL + posterPath)
    }
    var backdropURL: URL? {
        guard let backdropPath = backdropPath else {
            return nil
        }
            return URL(string: baseURL + backdropPath)
    }
    
    static var empty: Movie{
        return Movie(id: 0, title:"", overview: "", backdropPath: "", posterPath: "", voteAverage: 0)
    }
}
extension Movie: Codable{
private enum CodingKeys: String, CodingKey{
    case id
    case title
    case overview
    case backdropPath = "backdrop_path"
    case posterPath = "poster_path"
    case voteAverage = "vote_average"
}
}

extension Movie: Identifiable, Hashable{}

struct Movies: Codable{
    let page: Int
    let results: [Movie]
}



