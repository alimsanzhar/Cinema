//
//  MovieDataProvider.swift
//  Cinema
//
//  Created by mac on 8/1/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

protocol Service {
    func fetchMovies(completionHandler: @escaping([Movie]?, Error?) -> Void)
}

class MovieDataProvider: Service {
    func fetchMovies(completionHandler: @escaping ([Movie]?, Error?) -> Void) {
        Alamofire.request(Constants.Services.FAVOURITE).responseJSON { response in
            switch response.result {
            case .success(let data):
                guard let result = Mapper<Movie>().mapArray(JSONObject: data) else {
                    return
                }
                completionHandler(result, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
}
