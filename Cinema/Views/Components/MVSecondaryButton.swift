//
//  MVSecondaryButton.swift
//  Cinema
//
//  Created by mac on 8/6/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit

class MVSecondaryButton: UIButton {
    
    weak var delegate: Pressable?
    
    convenience init(with font: UIFont, textColor: UIColor ) {
        self.init(type: .system)
        self.titleLabel?.font = font
        self.setTitleColor(textColor, for: .normal)
        self.addTarget(self, action: #selector(didPress), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didPress() {
        delegate?.buttonDidPress(self)
    }
    
}
