//
//  Movie.swift
//  tmdb
//
//  Created by Clement Lantiat on 27/07/1401 AP.
//

import Foundation

struct Movie: Codable{
    let id : Int
    let title : String
    let overview : String
    let backdropPath : String
    
    private enum CodingKeys: String, CodingKey{
        case id
        case title
        case overview
        case backdropPath = "backdrop_path"
    }
}



