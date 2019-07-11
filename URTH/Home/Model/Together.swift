//
//  Together.swift
//  URTH
//
//  Created by 장용범 on 11/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct Together: Codable {
    let status: Int
    let message: String
    let data: [TogetherChallenge]
}

struct TogetherChallenge: Codable {
    let challengeIdx, name, image, count: String
}
