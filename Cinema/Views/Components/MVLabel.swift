//
//  TitleLabel.swift
//  Cinema
//
//  Created by mac on 8/6/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit

class MVLabel: UILabel {
    
    convenience init(with font: UIFont, textColor: UIColor) {
        self.init(frame: .zero)
        self.font = font
        self.textColor = textColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
