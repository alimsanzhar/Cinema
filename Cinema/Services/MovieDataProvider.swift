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
                guard let data = data as? [String: Any], let results = data["results"] as? [[String: Any]] else {
                    return
                }
                let result = Mapper<Movie>().mapArray(JSONArray: results)
                completionHandler(result, nil)
            case .failure(let error):
                print(error)
                completionHandler(nil, error)
            }
        }
    }
}
