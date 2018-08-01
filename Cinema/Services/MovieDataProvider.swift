//
//  MovieDataProvider.swift
//  Cinema
//
//  Created by mac on 8/1/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import Foundation

protocol Service {
    func fetchMovies(completionHandler: @escaping([Movie]?, Error?)->())
}

class MovieDataProvider: Service {
    func fetchMovies(completionHandler: @escaping ([Movie]?, Error?) -> ()) {
        //
    }
}
