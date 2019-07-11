//
//  TimeLine.swift
//  URTH
//
//  Created by 장용범 on 12/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct TimeLine: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [TimeLineData]
}

struct TimeLineData: Codable {
    let authChallengeIdx, userIdx, challengeIdx: Int
    let time, reportCount: String
    let image: String?
    let isWrong: Int
}
