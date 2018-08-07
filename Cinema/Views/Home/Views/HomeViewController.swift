//
//  ViewController.swift
//  Cinema
//
//  Created by mac on 7/31/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var stateViewController = ContentStateViewController()
    
    lazy var viewModel: HomeViewModel = {
        return HomeViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllerStyle()
        add(stateViewController)
        initViewModel()
    }
    
    private func initViewModel() {
        viewModel.showAlertClosure = { [weak self] in
            DispatchQueue.main.async {
                if let message = self?.viewModel.alertMessage {
                    self?.render(message)
                }
            }
        }
        //        viewModel.reloadTableViewClosure = { [weak self] in
        //            DispatchQueue.main.async {
        self.render(self.viewModel)
        //                self?.render((self?.viewModel)!)
        //            }
        //        }
        //        viewModel.loadMovies()
    }
    
    private func render(_ viewModel: HomeViewModel) {
        let contentVC = HomeContentViewController(viewModel)
        stateViewController.transition(to: .render(contentVC))
    }
    
    private func render(_ error: Error) {
        stateViewController.transition(to: .failed(error))
    }
    
    private func setupViewControllerStyle() {
        setNavigationBarTransparentBackground()
        setPrimaryBackgroundColor()
        setLargeTitle()
        title = Constants.Browse.TITLE
    }
}
