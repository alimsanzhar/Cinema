//
//  ContentViewController.swift
//  Cinema
//
//  Created by mac on 8/1/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit
import Cartography
import Kingfisher

class HomeContentViewController: UIViewController, Nameable {
    var viewModel: HomeViewModel!
    
    private lazy var separatorLine: MVSeparatorLine = {
        let line = MVSeparatorLine()
        return line
    }()
    
    private lazy var headerView: MVHeaderView = {
        let view = MVHeaderView(labelTitle: Constants.Browse.categoryTitle, buttonTitle: Constants.Browse.seeAll)
        view.button.delegate = self
        return view
    }()
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        return layout
    }()
    
    private lazy var collectionView: MVCollectionView = {
        let collectionView = MVCollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
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
        [separatorLine, headerView, collectionView].forEach {
            view.addSubview($0)
        }
    }
    
    func setupConstraints() {
        constrain(view, separatorLine) { view, line in
            line.top == view.top
            line.height == 0.3
            line.left == view.left + 18
            line.right == view.right - 18
        }
        constrain(view, headerView) { view, header in
            header.left == view.left + 18
            header.right == view.right - 18
            header.top == view.top + 10
            header.height == 20
        }
        constrain(headerView, collectionView, view) { header, collectionView, main in
            collectionView.top == header.bottom + 12
            collectionView.left == main.left + 18
            collectionView.right == main.right - 18
            collectionView.height == 110
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HomeCollectionViewCell
        let cellViewModel = viewModel.getCellViewModel(at: indexPath)
        cell.movieImageView.kf.setImage(with: URL(string: cellViewModel.imagePath))
        return cell
    }
}

extension HomeContentViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.width - 36)/4 - 8
        let height = width + 12
        return CGSize(width: width, height: height)
    }
}

extension HomeContentViewController: Pressable {
    func buttonDidPress(_ button: UIButton) {
        //
    }
}
