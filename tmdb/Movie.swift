//
//  Movie.swift
//  tmdb
//
//  Created by Clement Lantiat on 27/07/1401 AP.
//

import Foundation
import SwiftUI



struct Movie: Identifiable{
    let id : Int
    let title : String
    let overview : String
    let backdropPath : String
    
}
extension Movie: Codable{
private enum CodingKeys: String, CodingKey{
    case id
    case title
    case overview
    case backdropPath = "backdrop_path"
}
}

struct Movies: Codable{
    let page: Int
    let results: [Movie]
}



