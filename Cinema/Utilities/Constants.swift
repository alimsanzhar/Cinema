//
//  Constants.swift
//  Cinema
//
//  Created by mac on 7/31/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import Foundation

// swiftlint:disable identifier_name
struct Constants {
    struct Application {
        static let APP_NAME = "Cinema"
    }
    struct Services {
        static let apiKey = "94258d5ceb30d59a61d1253b2e3b3be2"
        static let favourite = "https://api.themoviedb.org/3/movie/popular?api_key=\(Constants.Services.apiKey)&language=en-US&page=1"
    }
    struct Browse {
        static let title = "Browse"
        static let categoryTitle = "Popular"
        static let seeAll = "See all"
    }
    struct List {
        static  let title = "List"
    }
    struct Settings {
        static let title = "Settings"
    }
    struct Links {
        static let imagePath = "https://image.tmdb.org/t/p/w300_and_h450_bestv2"
    }
}
