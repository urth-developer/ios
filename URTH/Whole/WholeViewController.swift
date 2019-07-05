//
//  WholeViewController.swift
//  URTH
//
//  Created by 장용범 on 03/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class WholeViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundView.backgroundColor = UIColor.init(patternImage: #imageLiteral(resourceName: "buzz"))
    }
  

}
