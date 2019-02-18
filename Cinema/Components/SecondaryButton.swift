//
//  MVSecondaryButton.swift
//  Cinema
//
//  Created by mac on 8/6/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit

class SecondaryButton: UIButton {
    
    weak var delegate: Pressable?
    
    convenience init() {
        self.init(type: .system)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func didPress() {
        delegate?.buttonDidPress(self)
    }
    
    private func commonInit() {
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.setTitleColor(.secondary, for: .normal)
        self.addTarget(self, action: #selector(didPress), for: .touchUpInside)
    }
}
