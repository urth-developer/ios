//
//  FriendTimeLine.swift
//  URTH
//
//  Created by 장용범 on 12/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct FriendTimeLine: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [FriendTimeLineData]
}

struct FriendTimeLineData: Codable {
    let authChallengeIdx, userIdx, challengeIdx: Int
    let image, time, reportCount: String
    let isWrong: Int
}
