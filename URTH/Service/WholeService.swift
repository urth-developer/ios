//
//  WholeService.swift
//  URTH
//
//  Created by 장용범 on 11/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct WholeService: APIService {
    
    // MARK : 카테고리별 챌린지 리스트 조회
    
    static func categoryChallengeList(idx: String, completion: @escaping (_ data: [CategoryChallenge])->Void){
        
        let URL = url("/urth/challenge/category/\(idx)")
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "카테고리별 챌린지 리스트 조회 성공"{
                            
                            let decoder = JSONDecoder()
                            do{
                                let data = try decoder.decode(Category.self, from: value)
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
    
    // MARK : 챌린지 TOP10 리스트 정보 조회
    
    static func top10Challenge(completion: @escaping (_ data: [Top10Challenge])->Void){
        
        let URL = url("/urth/challenge/top10")
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "top10 챌린지 리스트 조회 성공했습니다."{
                            
                            let decoder = JSONDecoder()
                            do{
                                let data = try decoder.decode(Top10.self, from: value)
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
    
    // MARK : 검색 키워드 리스트 조회
    
    static func searchKeywordList(completion: @escaping (_ data: [String])->Void){
        
        let URL = url("/urth/challenge/keyword")
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "검색 키워드 리스트 조회 성공"{
                            
                            let decoder = JSONDecoder()
                            do{
                                let data = try decoder.decode(SearchKeyword.self, from: value)
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
    
    // MARK : 검색한 챌린지 리스트 조회
    
    static func searchChallengeList(word: String, completion: @escaping (_ data: [SearchChallengeData])->Void){
        
        let URL = url("/urth/challenge/search\(word)")
        
        let body: [String: Any] = [
            "searchWord" : word
        ]
        
        Alamofire.request(URL, method: .get, parameters: body, encoding: JSONEncoding.default, headers: nil).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "검색한 챌린지 리스트 조회 성공"{
                            
                            let decoder = JSONDecoder()
                            do{
                                let data = try decoder.decode(SearchChallenge.self, from: value)
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
    
    //MARK: 챌린지 개설
    static func createChallenge(name: String, category: String, explanation: String, image: UIImage, completion: @escaping (_ message: String)-> Void) {
        
        let URL = url("/urth/challenge")
        
        let userdefault = UserDefaults.standard
        guard let token = userdefault.string(forKey: "token") else { return }
        let token_header = [ "token" : token ]
        
        let challengeName = name.data(using: .utf8)
        let challengeCategory = category.data(using: .utf8)
        let challengeExplanation = explanation.data(using: .utf8)
        let challengeImage = image.jpegData(compressionQuality: 0.3)
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            multipartFormData.append(challengeName!, withName: "name")
            multipartFormData.append(challengeCategory!, withName: "category")
            multipartFormData.append(challengeExplanation!, withName: "explanation")
            multipartFormData.append(challengeImage!, withName: "image", fileName: "photo.jpg", mimeType: "image/jpeg")
            
        }, to: URL, method: .post, headers: token_header ) { (encodingResult) in
            
            switch encodingResult {
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _) :
                upload.responseData(completionHandler: {(res) in
                    
                    switch res.result {
                    case .success:
                        if let value = res.result.value {
                            print(JSON(value))
                            do {
                                if let message = JSON(value)["message"].string{
                                    if message == "챌린지 개설 건의 성공했습니다."{
                                        completion("success")
                                    }
                                }
                                
                        }catch {
                            ("예외 발생")
                            }
                        }
                        break
                    case .failure(let err):
                        print(err.localizedDescription)
                        break
                    }
                })
                break
            case .failure(let err):
                print(err.localizedDescription)
            }
            
        }
    }
    
    // MARK : 챌린지 상세보기
    
    static func challengeDetail(idx: String, completion: @escaping (_ data: ChallengeDetailData)->Void){
        
        let URL = url("/urth/challenge/\(idx)")
        
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["token": token]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "챌린지 상세보기 성공"{
                            
                            let decoder = JSONDecoder()
                            do{
                                let data = try decoder.decode(ChallengeDetail.self, from: value)
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
    
    // MARK : 챌린지 한줄 응원 등록
    
    static func challengeComment(idx: String, comment: String, completion: @escaping (_ message: String)->Void){
        
        let URL = url("/urth/challenge/comment/\(idx)")
        
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["token": token]
        
        let body: [String: Any] = [
            "comment" : comment
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "챌린지 한줄 응원 등록 성공"{
                            completion("success")
                            
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
    
    // MARK : 챌린지 한줄 응원 리스트 조회
    
    static func challengeCommentList(idx: String, completion: @escaping (_ data: [ChallengeCommentData])->Void){
        
        let URL = url("/urth/challenge/comment/\(idx)")
        
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["token": token]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "챌린지 한줄 응원 리스트 조회 성공"{
                            let decoder = JSONDecoder()
                            do{
                                let data = try decoder.decode(ChallengeComment.self, from: value)
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
    
}
