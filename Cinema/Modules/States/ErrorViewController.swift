//
//  ErrorViewController.swift
//  Cinema
//
//  Created by mac on 8/1/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import UIKit

class ErrorViewController: UIViewController {
    private lazy var errorLabel = UILabel()
    var error: Error?

    init(_ error: Error) {
        super.init(nibName: nil, bundle: nil)
        self.error = error
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
