//
//  Favorite.swift
//  URTH
//
//  Created by 장용범 on 11/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct Favorite: Codable {
    let data: [FavoriteData]
    let message: String
    let status: Int
    let success: Bool
}

// MARK: - Datum
struct FavoriteData: Codable {
    let name: String
    let image: String
    let challengeIdx: Int
}
