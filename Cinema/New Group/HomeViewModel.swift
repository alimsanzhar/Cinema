//
//  HomeViewModel.swift
//  Cinema
//
//  Created by mac on 8/1/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit

struct MoviePoster {
    let imagePath: String
}

class HomeViewModel {
    
    var networkManager: NetworkManager!
    
    private var popularMovies: [Movie] = [Movie]()
    
    private var moviePosters: [MoviePoster] = [MoviePoster]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    var alertMessage: Error? {
        didSet {
            self.showAlertClosure?()
        }
    }
    var numberOfCells: Int {
        return moviePosters.count
    }
    var reloadTableViewClosure: (() -> Void)?
    var showAlertClosure: (() -> Void)?
    var updateLoadingStatus: (() -> Void)?
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func loadMovies() {
        self.isLoading = true
        
        networkManager.getPopularMovies { [weak self] movies, error  in
            if let error = error {
                self?.alertMessage = error
            } else {
                self?.processMoviePosters(movies: movies!)
            }
        }
    }
    
    func processMoviePosters(movies: [Movie]) {
        self.popularMovies = movies
        var posters = [MoviePoster]()
        for movie in movies {
            guard let path = movie.posterPath else {
                return
            }
            print("\(Constants.Links.imagePath)\(String(describing: path))")
            posters.append(MoviePoster(imagePath: "\(Constants.Links.imagePath)\(String(describing: path))"))
        }
        self.moviePosters = posters
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> MoviePoster {
        return moviePosters[indexPath.row]
    }
}
