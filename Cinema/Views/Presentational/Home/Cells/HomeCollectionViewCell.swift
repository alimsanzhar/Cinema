//
//  HomeTableViewCell.swift
//  Cinema
//
//  Created by mac on 8/2/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit
import Cartography

class HomeCollectionViewCell: UICollectionViewCell {
    
    lazy var supportingView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 5
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.1
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        return view
    }()
    
    lazy var movieImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        contentView.addSubview(supportingView)
        supportingView.addSubview(movieImageView)
    }
    
    func setupConstraints() {
        constrain(contentView, supportingView) { main, extra in
            extra.edges == main.edges
        }
        constrain(supportingView, movieImageView) { main, extra in
            extra.edges == main.edges
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
