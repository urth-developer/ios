//
//  MypageViewController.swift
//  URTH
//
//  Created by 장용범 on 03/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit
import Kingfisher

class MypageViewController: UIViewController {

    @IBOutlet weak var profileId: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileNickname: UILabel!
    let userdefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gesture = UITapGestureRecognizer(target: self, action: #selector(editProfile))
        profileImage.addGestureRecognizer(gesture)
        
        imageRounded()
        
        scrollView.delegate = self

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        // backIndicator custom
        let yourBackImage = #imageLiteral(resourceName: "btnBack")
        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.6901267767, green: 0.6902446747, blue: 0.6901112795, alpha: 1)
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        
        getInfo()
        
        scrollView.setContentOffset(CGPoint(x: 0, y: -65), animated: false)

    }
    
    func imageRounded(){
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.borderWidth = 2
    }
    
    @objc func editProfile(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        vc.image = profileImage.image!
        vc.nickname = profileNickname.text!
        vc.id = profileId.text!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func editProfile2(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        vc.image = profileImage.image!
        vc.nickname = profileNickname.text!
        vc.id = profileId.text!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension MypageViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let yVelocity = scrollView.panGestureRecognizer .velocity(in: scrollView).y
        
        if yVelocity > 0 {
            scrollView.bounces = false

        } else if yVelocity < 0 {
            scrollView.bounces = true

        }
        
    }
}

// Network

extension MypageViewController{
    func getInfo(){
        OurService.userInfo { (data) in
            if data.profileImg == ""{
                self.profileImage.image = #imageLiteral(resourceName: "profileNon")
            }else{
                self.profileImage.kf.setImage(with: URL(string: data.profileImg), placeholder: UIImage())
            }
            
            self.profileNickname.text = data.nickname
            self.profileId.text = data.id
        }
    }
}
