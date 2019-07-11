//
//  SearchKeyword.swift
//  URTH
//
//  Created by 장용범 on 11/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

struct SearchKeyword: Codable {
    let status: Int
    let message: String
    let data: [String]
}
