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
    var myInfo: InfoData? = nil
    var myTimeLines: [TimeLineData] = []
    
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
            
            if let image = myInfo?.profileImg{
                cell.profileImage.kf.setImage(with: URL(string: myInfo!.profileImg), placeholder: UIImage())
            }else{
                cell.profileImage.image = #imageLiteral(resourceName: "buzz")
            }
            if let nickname = myInfo?.nickname{
                cell.nickName.text = nickname
            }else{
                cell.nickName.text = ""
            }
            cell.level.text = "(Level. \(myInfo!.level)"
            cell.count.text = "총 \(myInfo!.userSuccessCount)회 인증"
            //cell.nickName.text = myTimeLines[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "OurMe2TableViewCell", for: indexPath) as! OurMe2TableViewCell
            cell.mainImage.kf.setImage(with: URL(string: myTimeLines[indexPath.row].image), placeholder: UIImage())
            cell.date.text = myTimeLines[indexPath.row].time
            
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

// Network

extension OurMeViewController{
    func getInfo(){
        OurService.userInfo { (data) in
            self.myInfo = data
            
        }
    }
    
    func getTimeLine(){
        OurService.userTimeLine { (timeLines) in
            self.myTimeLines = timeLines
            self.tableView.reloadData()
        }
    }
}
