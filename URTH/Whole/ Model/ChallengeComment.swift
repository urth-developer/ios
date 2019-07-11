//
//  ChallengeComment.swift
//  URTH
//
//  Created by 장용범 on 11/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct ChallengeComment: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [ChallengeCommentData]
}

// MARK: - Datum
struct ChallengeCommentData: Codable {
    let commentIdx, userIdx, challengeIdx: Int
    let comment, time: String
}
