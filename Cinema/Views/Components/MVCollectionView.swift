//
//  MVCollectionView.swift
//  Cinema
//
//  Created by mac on 8/7/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit

class MVCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
