//
//  Report.swift
//  URTH
//
//  Created by 장용범 on 11/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct Report: Codable {
    let data: [ReportChallenge]
    let success: Bool
    let message: String
    let status: Int
}

struct ReportChallenge: Codable {
    let image: String?
    let userIdx, authChallengeIdx: Int
}
