//
//  Today.swift
//  URTH
//
//  Created by 장용범 on 12/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct Today: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [TodayData]
}

struct TodayData: Codable {
    let challengeIdx: Int
    let name: String
    let image: String
    let creator: String?
    let count: Int
}
