//
//  MVHeaderView.swift
//  Cinema
//
//  Created by mac on 8/6/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit
import Cartography

class HeaderView: UIView {
    
    var labelTitle: String?
    var buttonTitle: String?
    
    lazy var label: SectionTitleLabel = {
        let label = SectionTitleLabel()
        label.text = labelTitle
        return label
    }()
    
    lazy var button: SecondaryButton = {
        let button = SecondaryButton()
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        [label, button].forEach(self.addSubview)
    }
    
    private func setupConstraints() {
        constrain(self, label) { view, label in
            label.left == view.left
            label.top == view.top
            label.height == 20
        }
        
        constrain(self, button) { view, button in
            button.right == view.right
            button.top == view.top
            button.height == 20
        }
    }
}
