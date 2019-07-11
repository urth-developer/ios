//
//  LoginViewController.swift
//  URTH
//
//  Created by 장용범 on 05/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit
import Alamofire


class LoginViewController: UIViewController {
    
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var wrongLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        wrongLabel.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
  
    @IBAction func login(_ sender: Any) {
        login()
    }
    
    @IBAction func goSign(_ sender: Any) {
        let vc = UIStoryboard(name: "Sign", bundle: nil).instantiateViewController(withIdentifier: "SignViewController") as! SignViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func lookAround(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainNavi")
        present(vc, animated: true, completion: nil)
    }
}


// Network

extension LoginViewController{
    func login() {
        SignService.login(id: gsno(id.text), password: gsno(password.text)) { (message) in
            if message == "success"{
                print("로그인 성공!!")
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainTab")
                self.present(vc, animated: true, completion: nil)
            }else if message == "failure"{
                print("login failure")
                self.wrongLabel.isHidden = false
                self.wrongLabel.shake()
            }
        }
    }
}
