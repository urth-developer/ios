//
//  MypageViewController.swift
//  URTH
//
//  Created by 장용범 on 03/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class MypageViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileNickname: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gesture = UITapGestureRecognizer(target: self, action: #selector(editProfile))
        profileImage.addGestureRecognizer(gesture)
        
        imageRounded()
        
        scrollView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
    }
    
    func imageRounded(){
        profileImage.layer.cornerRadius = profileImage.frame.height/2
    }
    
    @objc func editProfile(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        vc.image = profileImage.image!
        vc.nickname = profileNickname.text!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func editProfile2(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        vc.image = profileImage.image!
        vc.nickname = profileNickname.text!
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
