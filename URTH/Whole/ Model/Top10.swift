//
//  Top10.swift
//  URTH
//
//  Created by 장용범 on 11/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct Top10: Codable {
    let data: [Top10Challenge]
    let status: Int
    let success: Bool
    let message: String
}

struct Top10Challenge: Codable {
    let creator: String?
    let image: String
    let category: String
    let count, machineLearningCategory: Int
    let name, explanation: String
    let challengeIdx: Int
}
