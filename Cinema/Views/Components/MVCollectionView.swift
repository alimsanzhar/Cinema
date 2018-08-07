//
//  MVCollectionView.swift
//  Cinema
//
//  Created by mac on 8/7/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit

class MVCollectionView: UICollectionView {
    
    var width: CGFloat!
    var height: CGFloat!
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MVCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: width, height: height)
    }
}
