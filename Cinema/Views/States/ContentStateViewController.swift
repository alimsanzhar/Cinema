//
//  HomeStateViewController.swift
//  Cinema
//
//  Created by mac on 7/31/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import Foundation
import UIKit

class ContentStateViewController: UIViewController {
    private var state: State?
    private var shownViewController: UIViewController?

    func transition(to newState: State) {
        shownViewController?.remove()
        let incomingViewController = viewController(for: newState)
        add(incomingViewController)
        shownViewController = incomingViewController
        state = newState
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if state == nil {
            transition(to: .loading)
        }
    }
}
private extension ContentStateViewController {
    func viewController(for state: State) -> UIViewController {
        switch state {
        case .loading:
            return LoadingViewContoller()
        case .failed(let error):
            return ErrorViewController(error)
        case .render(let viewController):
            return viewController
        }
    }
}

extension ContentStateViewController {
    enum State {
        case loading
        case failed(Error)
        case render(UIViewController)
    }
}
