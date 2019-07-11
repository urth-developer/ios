//
//  SignService.swift
//  URTH
//
//  Created by 장용범 on 10/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct SignService: APIService {
    
    //MARK: 로그인
    static func login(id: String, password: String, completion: @escaping (_ message: String)->Void){
        
        let userdefault = UserDefaults.standard
        
        let URL = url("/urth/signin")
        
        let body: [String: Any] = [
            "id" : id,
            "password" : password
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    //print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "로그인 성공."{
                            /***************** USER DEFAULT *****************/
                            
                            let myToken = gsno(JSON(value)["data"]["token"].string)
                            let myNickName = gsno(JSON(value)["data"]["nickname"].string)
                            
                            userdefault.setValue(myToken, forKey: "token")
                            userdefault.setValue(id, forKey: "id")
                            userdefault.setValue(myNickName, forKey: "nickname")
                            
                            print("token: \(myToken)")
                            
                            completion("success")
                            
                            
                            
                        }else{ // 로그인 실패
                            print("로그인 실패 : "+message)
                            
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
    
    //MARK: 회원가입
    
    static func signup(id: String, nickname: String, password: String, completion: @escaping (_ message: String)->Void){
        
        let URL = url("/urth/signup")
        
        let body: [String: Any] = [
            "id" : id,
            "nickname" : nickname,
            "password" : password
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "회원가입 성공했습니다."{ 
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
