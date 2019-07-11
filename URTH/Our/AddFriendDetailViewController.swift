//
//  AddFriendDetailViewController.swift
//  URTH
//
//  Created by 장용범 on 08/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit
import Kingfisher

class AddFriendDetailViewController: UIViewController {
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    var nickName = ""
    var friendIdx = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "친구 추가"
        
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        searchFriend()
    }
    @IBAction func addFriend(_ sender: Any) {
        addFriend()
    }
    
}

// Network

extension AddFriendDetailViewController{
    func searchFriend(){
        OurService.searchFriend(nickname: nickName) { (data) in
            
            if data.userIdx != -1 {
                self.profileImage.isHidden = false
                self.level.isHidden = false
                self.searchButton.isHidden = false
                
                if let image = data.profileImg{
                    if image != ""{
                        self.profileImage.kf.setImage(with: URL(string: image), placeholder: UIImage())
                    }else{
                        self.profileImage.image = #imageLiteral(resourceName: "profileNon")
                    }
                }else{
                    self.profileImage.image = #imageLiteral(resourceName: "profileNon")
                }
                self.name.text = data.nickname
                self.level.text = "Level. \(data.level)"
                self.friendIdx = data.userIdx
            }else{
                self.profileImage.isHidden = true
                self.name.text = "사용자를 찾을 수 없습니다."
                self.level.isHidden = true
                self.searchButton.isHidden = true
                
            }
            
            
            
        }
    }
    
    func addFriend(){
        OurService.addFriend(idx: friendIdx) { (message) in
            if message == "success"{
                let alert = UIAlertController(title: nil, message: "친구 등록 성공!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else if message == "failure"{
                let alert = UIAlertController(title: nil, message: "이미 등록된 친구입니다!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
