//
//  HomeViewModel.swift
//  Cinema
//
//  Created by mac on 8/1/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit

struct PopularMoviesViewModel {
    let id: Int
    let imagePath: String
}

class HomeViewModel {
    
    var networkManager: NetworkManager!
    
    private var popularMovies: [Movie] = [Movie]() {
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
        return popularMovies.count
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
                self?.popularMovies = movies!
            }
        }
    }
    
    func getPopularCellViewModel(at indexPath: IndexPath) -> Movie {
        return popularMovies[indexPath.row]
    }
}
