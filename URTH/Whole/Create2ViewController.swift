//
//  Create2ViewController.swift
//  URTH
//
//  Created by 장용범 on 05/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class Create2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = ""
        addCloseButton()
    }
    
    func addCloseButton(){
        let barbuttonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btnClose"), style: .plain, target: self, action: #selector(close))
        barbuttonItem.tintColor = #colorLiteral(red: 0.1643726826, green: 0.5449098349, blue: 0.5535590649, alpha: 1)
        self.navigationItem.rightBarButtonItem = barbuttonItem
    }
    
    @objc func close(){
        self.dismiss(animated: true, completion: nil)
    }
 
    @IBAction func next(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Create3ViewController") as! Create3ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
