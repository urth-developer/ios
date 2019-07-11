//
//  OurService.swift
//  URTH
//
//  Created by 장용범 on 11/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct OurService: APIService {
    
    // MARK : 유저의 정보 조회
    
    static func userInfo(completion: @escaping (_ data: InfoData)->Void){
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["token": token]
        
        let URL = url("/urth/user/mydata")
        
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "유저의 정보 조회 성공"{
                            
                            let decoder = JSONDecoder()
                            do{
                                let data = try decoder.decode(Info.self, from: value)
                                completion(data.data)
                            }catch{
                                print("catcch....")
                            }
                            
                        }else{
                            
                        }
                    }
                }
                
                break
            case .failure(let err):
                print(err.localizedDescription)
                break
            }
        }
    }
    
    // MARK : 유저의 타임라인 조회
    
    static func userTimeLine(completion: @escaping (_ data: [TimeLineData])->Void){
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["token": token]
        
        let URL = url("/urth/user/timeline")
        
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "유저의 타임라인 조회 성공"{
                            
                            let decoder = JSONDecoder()
                            do{
                                let data = try decoder.decode(TimeLine.self, from: value)
                                completion(data.data)
                            }catch{
                                print("catcch....")
                            }
                            
                        }else{
                            
                        }
                    }
                }
                
                break
            case .failure(let err):
                print(err.localizedDescription)
                break
            }
        }
    }
    
    // MARK : 친구 목록 조회
    
    static func friendList(completion: @escaping (_ data: [FriendData])->Void){
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["token": token]
        
        let URL = url("/urth/user/friends/list")
        
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "친구 목록 조회 성공"{
                            
                            let decoder = JSONDecoder()
                            do{
                                let data = try decoder.decode(Friend.self, from: value)
                                completion(data.data)
                            }catch{
                                print("catcch....")
                            }
                            
                        }else{
                            
                        }
                    }
                }
                
                break
            case .failure(let err):
                print(err.localizedDescription)
                break
            }
        }
    }
    
    // MARK : 친구 상세 정보 조회
    
    static func friendDetail(idx: String, completion: @escaping (_ data: FriendDetailData)->Void){
        
        let URL = url("/urth/user/friends/\(idx)")
        
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["token": token]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "친구 상세 정보 조회 성공."{
                            
                            let decoder = JSONDecoder()
                            do{
                                let data = try decoder.decode(FriendDetail.self, from: value)
                                completion(data.data)
                            }catch{
                                print("catcch....")
                            }
                            
                        }else{
                            
                        }
                    }
                }
                
                break
            case .failure(let err):
                print(err.localizedDescription)
                break
            }
        }
    }
    
    // MARK : 친구 타임라인 조회
    
    static func friendTimeLine(idx: String, completion: @escaping (_ data: [FriendTimeLineData])->Void){
        
        let URL = url("/urth/user/friends/timeline/\(idx)")
        
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["token": token]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "친구의 타임라인 조회 성공"{
                            
                            let decoder = JSONDecoder()
                            do{
                                let data = try decoder.decode(FriendTimeLine.self, from: value)
                                completion(data.data)
                            }catch{
                                print("catcch....")
                            }
                            
                        }else{
                            
                        }
                    }
                }
                
                break
            case .failure(let err):
                print(err.localizedDescription)
                break
            }
        }
    }
    
    // MARK : 친구 검색
    
    static func searchFriend(nickname: String, completion: @escaping (_ data: FriendSearchData)->Void){
        
        let URL = url("/urth/user/friends/search/\(nickname)")
        
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["token": token]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "친구 검색 성공"{
                            
                            let decoder = JSONDecoder()
                            do{
                                let data = try decoder.decode(FriendSearch.self, from: value)
                                completion(data.data)
                            }catch{
                                print("catcch....")
                            }
                            
                        }else if message == "해당 닉네임의 유저가 존재하지 않습니다."{
                            completion(FriendSearchData(userIdx: -1, nickname: "", level: 0, profileImg: nil, friendship: false))
                        }
                    }
                }
                
                break
            case .failure(let err):
                print(err.localizedDescription)
                break
            }
        }
    }
    
    //MARK: 친구 추가
    
    static func addFriend(idx: Int, completion: @escaping (_ message: String)->Void){
        
        let URL = url("/urth/user/friends")
        
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["token": token]
        
        let body: [String: Any] = [
            "userIdx" : idx
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "친구 추가 성공."{
                            completion("success")
                        }else{
                            completion("failure")
                        }
                    }
                }
                
                break
            case .failure(let err):
                print(err.localizedDescription)
                break
            }
        }
    }
}
