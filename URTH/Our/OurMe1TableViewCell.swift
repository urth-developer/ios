//
//  OurMe1TableViewCell.swift
//  URTH
//
//  Created by 장용범 on 08/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit
import TKRadarChart

class OurMe1TableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var chart: TKRadarChart!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var level: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        chart.configuration.radius = 80
        chart.dataSource = self
        chart.delegate = self
        chart.reloadData()
        
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension OurMe1TableViewCell: TKRadarChartDataSource, TKRadarChartDelegate{
    func numberOfStepForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 4
    }
    func numberOfRowForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 5
    }
    func numberOfSectionForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 1
    }
    
    func titleOfRowForRadarChart(_ radarChart: TKRadarChart, row: Int) -> String {
        switch row {
        case 0:
            return "일회용품"
        case 1:
            return "수질"
        case 2:
            return "생태계"
        case 3:
            return "자원"
        case 4:
            return "대기"
        default:
            return "기본"
        }
    }
    
    func valueOfSectionForRadarChart(withRow row: Int, section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat(max(min(row + 1, 4), 3))
        } else {
            return 3
        }
    }
    
    func colorOfLineForRadarChart(_ radarChart: TKRadarChart) -> UIColor {
        return UIColor.white
    }
    
    func colorOfFillStepForRadarChart(_ radarChart: TKRadarChart, step: Int) -> UIColor {
        switch step {
        case 1:
            return UIColor(red:1,  green:1,  blue:1, alpha:1)
        case 2:
            return UIColor(red:1,  green:1,  blue:1, alpha:0.8)
        case 3:
            return UIColor(red:1,  green:1,  blue:1, alpha:0.6)
        case 4:
            return UIColor(red:1,  green:1,  blue:1, alpha:0.4)
        default:
            return UIColor.white
        }
    }
    
    func colorOfSectionFillForRadarChart(_ radarChart: TKRadarChart, section: Int) -> UIColor {
        if section == 0 {
            return #colorLiteral(red: 0.1643726826, green: 0.5449098349, blue: 0.5535590649, alpha: 1).withAlphaComponent(0.8)
        } else {
            return UIColor(red:0,  green:0.788,  blue:0.543, alpha:0.4)
        }
    }
    
    func colorOfSectionBorderForRadarChart(_ radarChart: TKRadarChart, section: Int) -> UIColor {
        if section == 0 {
            return UIColor.white
        } else {
            return UIColor.white
        }
    }
    
    func fontOfTitleForRadarChart(_ radarChart: TKRadarChart) -> UIFont {
        return UIFont.systemFont(ofSize: 13)
    }
    
    func colorOfTitleForRadarChart(_ radarChart: TKRadarChart) -> UIColor {
        return UIColor.white
    }
    
}
