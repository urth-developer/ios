//
//  AddFriendViewController.swift
//  URTH
//
//  Created by 장용범 on 08/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nickNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nickNameTextField.delegate = self
        nickNameTextField.returnKeyType = .search
        
        self.navigationItem.title = "친구 추가"
        //self.navigationController?.navigationBar.backItem?.title = ""

        

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddFriendDetailViewController") as! AddFriendDetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
        return true
    }
    
    
    
}
