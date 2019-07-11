//
//  MyPageService.swift
//  URTH
//
//  Created by 장용범 on 12/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct MyPageService: APIService {
    
    //MARK: 프로필 수정
    static func changeProfile(id: String, nickname: String, image: UIImage, completion: @escaping (_ message: String)-> Void) {
        
        let URL = url("/urth/user/profile")
        
        let userdefault = UserDefaults.standard
        guard let token = userdefault.string(forKey: "token") else { return }
        let token_header = [ "token" : token ]
        
        let idData = id.data(using: .utf8)
        let nickNameData = nickname.data(using: .utf8)
        let imageData = image.jpegData(compressionQuality: 0.3)
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            multipartFormData.append(idData!, withName: "id")
            multipartFormData.append(nickNameData!, withName: "nickname")
            multipartFormData.append(imageData!, withName: "profileImg", fileName: "photo.jpg", mimeType: "image/jpeg")
            
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
                                    if message == "프로필 수정 성공"{
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
