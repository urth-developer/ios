//
//  OurMeViewController.swift
//  URTH
//
//  Created by 장용범 on 08/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class OurMeViewController: UIViewController, IndicatorInfoProvider {
    
    
    var childNumber = ""
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
       
    }
    
  
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "나")
    }
  

}

extension OurMeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "OurMe1TableViewCell", for: indexPath) as! OurMe1TableViewCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "OurMe2TableViewCell", for: indexPath) as! OurMe2TableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row > 0{
            return 66
        }
        return 350
    }
    
    
}
