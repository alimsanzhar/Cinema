//
//  Result.swift
//  Cinema
//
//  Created by Beknar Danabek on 07/08/2018.
//  Copyright © 2018 trashLabs. All rights reserved.
//

import Foundation

enum Result<Error> {
    case success
    case failure(Error)
}
