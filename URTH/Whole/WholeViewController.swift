//
//  WholeViewController.swift
//  URTH
//
//  Created by 장용범 on 03/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class WholeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
    @IBAction func createChallenge(_ sender: Any) {
        print("create challenge!")
        let vc = storyboard?.instantiateViewController(withIdentifier: "CreateNavi")
        present(vc!, animated: true, completion: nil)
    }
    
}
