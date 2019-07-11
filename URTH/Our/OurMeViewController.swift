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
    
    override func viewWillAppear(_ animated: Bool) {
        getInfo()
        getTimeLine()
    }
    
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "나")
    }
    
    
}

extension OurMeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTimeLines.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "OurMe1TableViewCell", for: indexPath) as! OurMe1TableViewCell
            
            if let image = myInfo?.profileImg{
                if image == ""{
                    cell.profileImage.image = #imageLiteral(resourceName: "profileNon")
                }else{
                    cell.profileImage.kf.setImage(with: URL(string: image), placeholder: UIImage())
                }
            }else{
                cell.profileImage.image = #imageLiteral(resourceName: "profileNon")
            }
            if let nickname = myInfo?.nickname{
                cell.nickName.text = nickname
            }else{
                cell.nickName.text = ""
            }
            //cell.count.text = "총 \(myInfo!.userSuccessCount)회 인증"
            //cell.nickName.text = myTimeLines[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "OurMe2TableViewCell", for: indexPath) as! OurMe2TableViewCell
            
            if let image = myTimeLines[indexPath.row-1].image{
                if image == ""{
                    cell.mainImage.image = #imageLiteral(resourceName: "imgChal")
                }else{
                    cell.mainImage.kf.setImage(with: URL(string: image), placeholder: UIImage())
                }
            }else{
                cell.mainImage.image = #imageLiteral(resourceName: "imgChal")
            }
            
            cell.date.text = myTimeLines[indexPath.row-1].time
            
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
            self.tableView.reloadData()
        }
    }
    
    func getTimeLine(){
        OurService.userTimeLine { (timeLines) in
            self.myTimeLines = timeLines
            self.tableView.reloadData()
        }
    }
}
