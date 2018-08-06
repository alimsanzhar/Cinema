//
//  MVHeaderView.swift
//  Cinema
//
//  Created by mac on 8/6/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit
import Cartography

class MVHeaderView: UIView {
    
    var labelTitle: String?
    var buttonTitle: String?
    
    lazy var label: MVLabel = {
        let label = MVLabel(with: UIFont.systemFont(ofSize: 14, weight: .regular), textColor: .white)
        label.text = labelTitle
        return label
    }()
    
    lazy var button: MVSecondaryButton = {
        let button = MVSecondaryButton(with: UIFont.systemFont(ofSize: 14), textColor: .secondary)
        button.setTitle(buttonTitle, for: .normal)
        return button
    }()
    
    convenience init(labelTitle: String, buttonTitle: String) {
        self.init(frame: .zero)
        self.labelTitle = labelTitle
        self.buttonTitle = buttonTitle
        setupViews()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setupViews() {
        [label, button].forEach {
            self.addSubview($0)
        }
    }
    
    func setupConstraints() {
        constrain(self, label) { view, label in
            label.left == view.left
            label.top == view.top
            label.height == 20
            
        }
        
        constrain(self, button) { view, button in
            button.right == view.right
            button.top == view.top
            button.width == 60
            button.height == 20
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
