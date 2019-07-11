//
//  Info.swift
//  URTH
//
//  Created by 장용범 on 12/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct Info: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: InfoData
}

struct InfoData: Codable {
    let userIdx: Int
    let id, nickname: String
    let level, experiencePoint: Int
    let profileImg: String
    let userAuthCountsByCategory: UserAuthCountsByCategory
    let userSuccessCount: Int
}

struct UserAuthCountsByCategory: Codable {
    let category3, category4, category5, category1: Int
    let category2: Int
}
