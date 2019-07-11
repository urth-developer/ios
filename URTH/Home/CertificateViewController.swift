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

    var category: Int = 1
    @IBOutlet weak var circularSlider: MTCircularSlider!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var comment: UILabel!
    
    let userdefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCategory()
        setNavigationBarClear()
        circularSlider.transform = circularSlider.transform.rotated(by: CGFloat.init(Double.pi/2))
        circularSlider.isEnabled = false

    }
    
    func setCategory(){
        let categoryNum = userdefault.integer(forKey: "currentCertificateIndex")
        print(categoryNum)
        //print("category:\(category)")
        switch categoryNum {
        case 1:
            categoryImage.image = #imageLiteral(resourceName: "imgDisposableProducts")
            break
        case 2:
            categoryImage.image = #imageLiteral(resourceName: "imgAtmosphere")
            break
        case 3:
            categoryImage.image = #imageLiteral(resourceName: "imgResource")
            break
        case 4:
            categoryImage.image = #imageLiteral(resourceName: "imgWaterQuality")
            break
        case 5:
            categoryImage.image = #imageLiteral(resourceName: "imgEcosystem")
            break
        default:
            categoryImage.image = #imageLiteral(resourceName: "imgDisposableProducts")
            break
        }
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
