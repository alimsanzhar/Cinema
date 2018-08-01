//
//  HomeViewModel.swift
//  Cinema
//
//  Created by mac on 8/1/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit

struct PopularMoviesViewModel{
    let id: Int
    let imagePath: String
}

class HomeViewModel {
    
    let apiService: Service?
    
    private var popularMovies: [Movie] = [Movie]() {
        didSet{
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
        return popularMovies.count
    }
    
    var reloadTableViewClosure: (()->())?
    var showAlertClosure: (()->())?
    var updateLoadingStatus: (()->())?
    
    init(service: Service = MovieDataProvider()){
        self.apiService = service
    }
    
    func loadMovies() {
        self.isLoading = true
        apiService?.fetchMovies { [weak self] (movies, error) in
            self?.isLoading = false
            if let error = error {
                self?.alertMessage = error
            } else {
                self?.popularMovies = movies!
            }
        }
    }
    
    func getPopularCellViewModel(at indexPath: IndexPath) -> Movie {
        return popularMovies[indexPath.row]
    }
    
//    private func processFetchedMovies(movies: [Movie]) {
//        self.movies = movies
//        var fetchedMovies = [PopularMoviesViewModel]()
//        for movie in movies {
//            let processedMovie = PopularMoviesViewModel(id: movie.id, imagePath: movie.posterPath)
//            fetchedMovies.append(processedMovie)
//        }
//        self.popularMovies = fetchedMovies
//    }
}
