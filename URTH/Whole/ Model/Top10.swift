//
//  Top10.swift
//  URTH
//
//  Created by 장용범 on 11/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct Top10: Codable {
    let success: Bool
    let status: Int
    let data: [Top10Challenge]
    let message: String
}

struct Top10Challenge: Codable {
    let image: String?
    let name: String
    let count: Int
    let creator: String?
    let challengeIdx: Int
}
