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
        static let API_KEY = "94258d5ceb30d59a61d1253b2e3b3be2"
        static let FAVOURITE = "https://api.themoviedb.org/3/movie/popular?api_key=\(Constants.Services.API_KEY)&language=en-US&page=1"
    }
    struct Browse {
        static let TITLE = "Browse"
        static let CATEGORY_TITLE = "Popular"
        static let SEE_ALL = "See all"
    }
    struct List {
        static let TITLE = "List"
    }
    struct Settings {
        static let TITLE = "Settings"
    }
}
