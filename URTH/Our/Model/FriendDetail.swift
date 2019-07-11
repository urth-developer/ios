//
//  FriendDetail.swift
//  URTH
//
//  Created by 장용범 on 12/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct FriendDetail: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: FriendDetailData
}

struct FriendDetailData: Codable {
    let userIdx, id, nickname: String
    let level, experiencePoint: Int
    let profileImg: String
    let userAuthCountsByCategory: UserAuthCountsByCategory
    let userSuccessCount: Int
}

