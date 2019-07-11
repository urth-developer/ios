//
//  ProfileViewController.swift
//  URTH
//
//  Created by 장용범 on 06/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileNickname: UITextField!
    let userdefault = UserDefaults.standard
    
    var image: UIImage = UIImage()
    var changeImage: UIImage = UIImage()
    var nickname: String = ""
    
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        
        profileImage.image = image
        profileNickname.text = nickname
        
        profileImage.layer.cornerRadius = profileImage.frame.height/2

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.title = "프로필 수정"
        
        if let nick = userdefault.string(forKey: "nickname"){
            self.profileNickname.text = nick
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func adjust(_ sender: Any) {
        modifyProfile()
    }
    
    @IBAction func selectProfileImage(_ sender: Any) {
        present(picker, animated: true, completion: nil)
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            self.profileImage.image = image
            changeImage = image
            
        }
        
        dismiss(animated: true, completion: nil)
    }
}

// Network

extension ProfileViewController{
    func modifyProfile(){
        guard let myId = userdefault.string(forKey: "id") else {return}
        guard let myNickName = profileNickname.text else {return}
        MyPageService.changeProfile(id: myId, nickname: myNickName, image: changeImage) { (message) in
            if message == "success"{
                let alert = UIAlertController(title: nil, message: "프로필 수정 성공!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                let alert = UIAlertController(title: nil, message: "프로필 수정 실패!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
