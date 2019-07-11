//
//  Favorite.swift
//  URTH
//
//  Created by 장용범 on 11/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct Favorite: Codable {
    let status: Int
    let message: String
    let data: [FavoriteChallenge]
}

struct FavoriteChallenge: Codable {
    let challengeIdx, name, category, explanation: String
    let image, count, favoriteOrder: String
}
