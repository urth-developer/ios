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
        
        var base64String: NSString!
        
        let challengeIdx = idx.data(using: .utf8)
        let challengeImage = image.jpegData(compressionQuality: 0.3)
        
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
                            print(JSON(value))
                            do {
                                if let message = JSON(value)["message"].string{
                                    if message == "챌린지 사진 인증 성공했습니다.."{
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
}
