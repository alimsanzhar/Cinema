//
//  NetworkManager.swift
//  Cinema
//
//  Created by Beknar Danabek on 07/08/2018.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import Foundation

struct NetworkManager {
    static let environment: NetworkEnvironment = .production
    static let apiKey = "94258d5ceb30d59a61d1253b2e3b3be2"
    private let router = Router<MovieApi>()
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<Error> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError)
        case 501...599: return .failure(NetworkResponse.badRequest)
        case 600: return .failure(NetworkResponse.outdated)
        default: return .failure(NetworkResponse.failed)
        }
    }

    
    func getPopularMovies(completion: @escaping (_ movies: [Movie]?, _ error: Error?) -> Void) {
        router.request(.popular) { data, response, error in
            if error != nil {
                completion(nil, NetworkResponse.noNetwork)
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(MovieApiResponse.self, from: responseData)
                        completion(apiResponse.movies, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode)
                    }
                case .failure(let error):
                    completion(nil, error)
                }
            }
        }
    }
    
}
