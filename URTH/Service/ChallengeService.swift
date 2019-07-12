//
//  ChallengeService.swift
//  URTH
//
//  Created by 장용범 on 11/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

struct ChallengeService: APIService {
    
    //MARK: 챌린지 인증하기
    static func certificateChallenge(idx: String, image: UIImage, completion: @escaping (_ message: String)-> Void) {
        
        let URL = url("/urth/auth")
        
        let userdefault = UserDefaults.standard
        guard let token = userdefault.string(forKey: "token") else { return }
        let token_header = [ "token" : token ]
        
        let challengeIdx = idx.data(using: .utf8)
        let challengeImage = image.jpegData(compressionQuality: 0.3)
        print("인증 challenge idx: \(idx)")
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            multipartFormData.append(challengeIdx!, withName: "challengeIdx")
            multipartFormData.append(challengeImage!, withName: "image", fileName: "photo.jpg", mimeType: "image/jpeg")
            
        }, to: URL, method: .post, headers: token_header ) { (encodingResult) in
            
            switch encodingResult {
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _) :
                upload.responseData(completionHandler: {(res) in
    
                    switch res.result {
                    case .success:
                        if let value = res.result.value {
                            //print(JSON(value))
                            do {
                                if let message = JSON(value)["message"].string{
                                    if message == "챌린지 사진 인증 성공했습니다."{
                                        completion("success")
                                    }else if message == "챌린지 사진 인증 실패했습니다."{
                                        completion("failure")
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
    
    // MARK : 신고 할 수 있는 이미지 리스트 조회
    
    static func reportList(idx: Int, completion: @escaping (_ data: [ReportChallenge])->Void){
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["token": token]
        
        let URL = url("/urth/auth/report/\(idx)")
        
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "신고 가능한 이미지 리스트 조회 성공했습니다."{
                            
                            let decoder = JSONDecoder()
                            do{
                                let data = try decoder.decode(Report.self, from: value)
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
    
    //MARK: 해당 챌린지에서 이상한 사진 신고
    
    static func report(idx: Int, completion: @escaping (_ message: String)->Void){
        
        let URL = url("/urth/auth/report")
        
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["token": token]
        
        let body: [String: Any] = [
            "authchallengeIdx" : idx
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    //print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "해당 이미지 신고 하기가 성공했습니다."{
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
    
    // MARK : 챌린지 완료 화면 정보 조회

    static func completeChallenge(idx: String, completion: @escaping (_ data: CompleteData)->Void){
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["token": token]
        
        let URL = url("/urth//auth/result/\(idx)")
        
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "챌린지 완료 화면 정보 조회 성공."{
                            
                            let decoder = JSONDecoder()
                            do{
                                let data = try decoder.decode(Complete.self, from: value)
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
