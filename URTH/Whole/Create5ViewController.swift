//
//  Create5ViewController.swift
//  URTH
//
//  Created by 장용범 on 05/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class Create5ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    @IBAction func complete(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Create6ViewController") as! Create6ViewController
        present(vc, animated: true, completion: nil)
    }
}
