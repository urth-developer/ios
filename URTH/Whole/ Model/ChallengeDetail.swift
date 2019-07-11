//
//  ChallengeDetail.swift
//  URTH
//
//  Created by 장용범 on 11/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct ChallengeDetail: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: ChallengeDetailData
}

struct ChallengeDetailData: Codable {
    let creator: String
    let challengeIdx: Int
    let name, explanation: String
    let image: String
    let count: Int
    let category: String
    let totalSuccessCount, participantCount, userSuccessCount: Int
}
