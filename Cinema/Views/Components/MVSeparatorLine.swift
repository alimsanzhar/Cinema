//
//  MVSeparatorLine.swift
//  Cinema
//
//  Created by mac on 8/7/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit
import Cartography

class MVSeparatorLine: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }
    
    func setupStyle() {
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
