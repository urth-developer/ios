//
//  Create1ViewController.swift
//  URTH
//
//  Created by 장용범 on 05/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class Create1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func next(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Create2ViewController") as! Create2ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
