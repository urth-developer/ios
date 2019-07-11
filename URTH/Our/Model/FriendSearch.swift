//
//  FriendSearch.swift
//  URTH
//
//  Created by 장용범 on 12/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct FriendSearch: Codable {
    let status: Int
    let message: String
    let data: FriendSearchData
}

struct FriendSearchData: Codable {
    let userIdx: Int
    let nickname: String
    let level: Int
    let profileImg: String?
    let friendship: Bool
}
