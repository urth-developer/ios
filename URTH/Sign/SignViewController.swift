//
//  SignViewController.swift
//  URTH
//
//  Created by 장용범 on 05/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit
import Alamofire

class SignViewController: UIViewController {

    @IBOutlet weak var scrollView: UIView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var password2: UITextField!
    @IBOutlet weak var nickName: UITextField!
    
    @IBOutlet weak var emailCheck: UIButton!
    @IBOutlet weak var passwordCheck: UIButton!
    @IBOutlet weak var passwordCheck2: UIButton!
    @IBOutlet weak var nickNameCheck: UIButton!
    
    @IBOutlet weak var wrongPasswordLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        addScrollViewEndEditing()
        email.delegate = self
        password.delegate = self
        password2.delegate = self
        nickName.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        wrongPasswordLabel.isHidden = true
    }
   
    func addScrollViewEndEditing(){
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scrollTapMethod))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled = true
        singleTapGestureRecognizer.cancelsTouchesInView = false
        scrollView.addGestureRecognizer(singleTapGestureRecognizer)
    }

    @objc func scrollTapMethod(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    @IBAction func signUp(_ sender: Any) {
        signup()
    }
}

// TextField Delegate

extension SignViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == password2{
            if password.text != password2.text {
                wrongPasswordLabel.isHidden = false
                wrongPasswordLabel.shake()
            }else{
                wrongPasswordLabel.isHidden = true
                passwordCheck2.imageView?.image = #imageLiteral(resourceName: "iconCheck")
            }
        }
        
        if textField == email{
            emailCheck.imageView?.image = #imageLiteral(resourceName: "iconCheck")
        }
        if textField == password{
            passwordCheck.imageView?.image = #imageLiteral(resourceName: "iconCheck")
        }
        
        if textField == nickName{
            if textField.text?.count ?? 10 <= 8{
                nickNameCheck.imageView?.image = #imageLiteral(resourceName: "iconCheck")
            }else{
                nickNameCheck.imageView?.image = #imageLiteral(resourceName: "iconCheckGray")
            }
            
        }
        
    }
}

// Network

extension SignViewController{
    func signup() {
        SignService.signup(id: gsno(email.text), nickname: gsno(nickName.text), password: gsno(password.text)) { (message) in
            if message == "success"{
                self.navigationController?.popViewController(animated: true)
            }else if message == "failure"{
                print("login failure")
                let alert = UIAlertController(title: nil, message: "회원가입 실패", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
}
