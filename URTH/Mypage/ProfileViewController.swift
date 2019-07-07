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
    
    var image: UIImage = UIImage()
    var nickname: String = ""
    
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveProfile))

        picker.delegate = self
        
        profileImage.image = image
        profileNickname.text = nickname
        
        profileImage.layer.cornerRadius = profileImage.frame.height/2

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.title = "프로필 수정"
        
    }
    
    
    @objc func saveProfile(){
        print("SAVE PROFILE")
    }
    

    @IBAction func selectProfileImage(_ sender: Any) {
        present(picker, animated: true, completion: nil)
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            self.profileImage.image = image
            
        }
        
        dismiss(animated: true, completion: nil)
    }
}
