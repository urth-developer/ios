//
//  HomeService.swift
//  URTH
//
//  Created by 장용범 on 11/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct HomeService: APIService{
    
    //MARK : 어스 성과 요약
    static func summary(completion: @escaping (_ data: SummaryData)->Void){
        
        let URL = url("/urth/challenge/summary")
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    //print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "어스 정보 조회 성공"{ 
                            print("어스 정보 조회 성공")
                            let decoder = JSONDecoder()
                            do{
                                let data = try decoder.decode(Summary.self, from: value)
                                completion(data.data)
                            }catch{
                                print("catcch....")
                            }
                            
                        }else{
                            print("어스 정보 조회 실패")
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
    
    
    // MARK : 즐겨 찾기 챌린지 리스트 정보 조회
    
    static func favoriteChallenge(completion: @escaping (_ data: [FavoriteChallenge])->Void){
        let userDefault = UserDefaults.standard

        guard let token = userDefault.string(forKey: "token") else { return }

        let headers = ["token": token]

        let URL = url("/urth/challenge/favorite")


        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "즐켜찾기 챌린지 리스트 조히 성공했습니다."{
                            
                            let decoder = JSONDecoder()
                            do{
                                let data = try decoder.decode(Favorite.self, from: value)
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
    
    // MARK : 함께 하기 챌린지 리스트 정보 조회
    
    static func togetherChallenge(completion: @escaping (_ data: [TogetherChallenge])->Void){
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["token": token]
        
        let URL = url("urth/challenge/together")
        
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print(JSON(value))
                    if let message = JSON(value)["message"].string{
                        if message == "함께하기 챌린지 리스트 조회 성공했습니다."{
                            
                            let decoder = JSONDecoder()
                            do{
                                let data = try decoder.decode(Together.self, from: value)
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
