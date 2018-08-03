//
//  Movie.swift
//  Cinema
//
//  Created by mac on 8/1/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import Foundation
import ObjectMapper

class Movie: Mappable {
    var movieId: Int?
    var title: String?
    var rating: Int?
    var posterPath: String?
    var overview: String?
    var releaseDate: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        movieId <- map["id"]
        title <- map["title"]
        rating <- map["vote_average"]
        posterPath <- map["poster_path"]
        overview <- map["overview"]
        releaseDate <- map["release_date"]
    }
    
}
