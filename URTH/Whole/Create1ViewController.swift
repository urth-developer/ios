//
//  Create1ViewController.swift
//  URTH
//
//  Created by 장용범 on 05/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class Create1ViewController: UIViewController {
    
    let userdefault = UserDefaults.standard

    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        // backIndicator cutom
        let yourBackImage = #imageLiteral(resourceName: "btnBack")
        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.6901267767, green: 0.6902446747, blue: 0.6901112795, alpha: 1)
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func next(_ sender: Any) {
        if let name = nameTextField.text{
            if name != ""{
                userdefault.setValue(name, forKey: "create_name")
                let vc = storyboard?.instantiateViewController(withIdentifier: "Create2ViewController") as! Create2ViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                let alert = UIAlertController(title: nil, message: "챌린지 이름을 입력해주세요", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        
    }
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
