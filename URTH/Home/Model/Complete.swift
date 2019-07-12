//
//  Complete.swift
//  URTH
//
//  Created by 장용범 on 13/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct Complete: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: CompleteData
}

struct CompleteData: Codable {
    let challengeIdx, count: Int
    let category: String
    let userSuccessCount: Int
}
