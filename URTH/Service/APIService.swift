//
//  APIService.swift
//  URTH
//
//  Created by 장용범 on 10/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation

protocol APIService {
    
}

extension APIService {
    static func url(_ path: String) -> String {
        return "http://52.79.173.137:3000" + path
    }
    
    static func gsno(_ value: String?) -> String { //String 옵셔널 벗기기
        return value ?? ""
    }
    
    static func gino(_ value: Int?) -> Int { //Int 옵셔널 벗기기
        return value ?? 0
    }
    
}
