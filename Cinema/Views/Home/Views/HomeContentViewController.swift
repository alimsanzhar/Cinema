//
//  ContentViewController.swift
//  Cinema
//
//  Created by mac on 8/1/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit
import Cartography

class HomeContentViewController: UIViewController, Nameable {
    var viewModel: HomeViewModel!
    
    private lazy var headerView: MVHeaderView = {
        let view = MVHeaderView(labelTitle: Constants.Browse.TITLE, buttonTitle: Constants.Browse.SEE_ALL)
        view.button.delegate = self
        return view
    }()
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        return collectionView
    }()

    init(_ viewModel: HomeViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        [headerView].forEach {
            view.addSubview($0)
        }
    }
    
    func setupConstraints() {
        constrain (view, headerView) { view, header in
            header.left == view.left + 25
            header.right == view.right - 25
            header.top == view.top + 10
            header.height == 20
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeContentViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return cell
    }
}

extension HomeContentViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.size.width - 50)/4 - 8
        let height = width + 12
        return CGSize(width: width, height: height)
    }
}

extension HomeContentViewController: Pressable {
    func buttonDidPress(_ button: UIButton) {
        //
    }
}
