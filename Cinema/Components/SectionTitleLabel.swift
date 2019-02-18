//
//  TitleLabel.swift
//  Cinema
//
//  Created by mac on 8/6/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit

class SectionTitleLabel: UILabel {
    
    convenience init() {
        self.init(frame: .zero)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.font = UIFont.systemFont(ofSize: 14)
        self.textColor = .white
    }
}
