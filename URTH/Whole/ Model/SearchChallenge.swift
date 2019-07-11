//
//  SearchChallenge.swift
//  URTH
//
//  Created by 장용범 on 11/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct SearchChallenge: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [SearchChallengeData]
}

struct SearchChallengeData: Codable {
    let challengeIdx: Int
    let name, image: String
    let count: Int
    let category, creator: String
}
