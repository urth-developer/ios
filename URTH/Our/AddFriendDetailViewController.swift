//
//  AddFriendDetailViewController.swift
//  URTH
//
//  Created by 장용범 on 08/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class AddFriendDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "친구 추가"
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "btnBack")
        //self.navigationController?.navigationBar.backItem?.title = ""

    }
    
}
