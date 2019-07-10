//
//  CertificateViewController.swift
//  URTH
//
//  Created by 장용범 on 05/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit
import MTCircularSlider

class CertificateViewController: UIViewController {

    @IBOutlet weak var circularSlider: MTCircularSlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBarClear()
        circularSlider.transform = circularSlider.transform.rotated(by: CGFloat.init(Double.pi/2))
        circularSlider.isEnabled = false

    }
    
    @IBAction func showAnother(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CertificateAllViewController") as! CertificateAllViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func setNavigationBarClear() {
        let bar: UINavigationBar! = self.navigationController?.navigationBar
        
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
    }

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
