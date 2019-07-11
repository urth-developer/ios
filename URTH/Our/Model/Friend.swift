//
//  Friend.swift
//  URTH
//
//  Created by 장용범 on 12/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct Friend: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [FriendData]
}

struct FriendData: Codable {
    let userSuccessCount, userIdx: Int
    let nickname: String
    let level: Int
    let profileImg: String?
}
