//
//  Category.swift
//  URTH
//
//  Created by 장용범 on 11/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct Category: Codable {
    let data: [CategoryChallenge]
    let message: String
    let status: Int
    let success: Bool
}

struct CategoryChallenge: Codable {
    let challengeIdx: Int
    let category: String
    let image: String
    let name: String
    let creator: String?
    let count: Int
}
