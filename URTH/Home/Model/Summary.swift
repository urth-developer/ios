//
//  Summary.swift
//  URTH
//
//  Created by 장용범 on 11/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct Summary: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SummaryData
}

struct SummaryData: Codable {
    let authCountsByCategory: AuthCountsByCategory
    let totalSuccessCount, totalUserCount: Int
}

// MARK: - AuthCountsByCategory
struct AuthCountsByCategory: Codable {
    let category1, category2, category3, category4, category5: Int
}
