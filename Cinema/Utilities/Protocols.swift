//
//  Protocols.swift
//  Cinema
//
//  Created by mac on 7/31/18.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import Foundation

protocol Nameable {
    var identifier: String { get }
}

extension Nameable {
    var identifier: String {
        return String(describing: self)
    }
}
