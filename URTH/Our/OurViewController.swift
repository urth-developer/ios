//
//  OurViewController.swift
//  URTH
//
//  Created by 장용범 on 03/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class OurViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        configureButtonBar()
        super.viewDidLoad()

        self.navigationItem.title = "우리의 어스"
        setNavigationBarClear()
    }
    
    func setNavigationBarClear() {
        let bar: UINavigationBar! = self.navigationController?.navigationBar
        
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child1 = storyboard?.instantiateViewController(withIdentifier: "OurMeViewController") as! OurMeViewController

        
       let child2 = storyboard?.instantiateViewController(withIdentifier: "OurFriendViewController") as! OurFriendViewController
        
        return [child1,child2]
    }
    
    // MARK: - Configuration
    
    func configureButtonBar() {
        // Sets the background colour of the pager strip and the pager strip item
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        
        // Sets the pager strip item font and font color
        settings.style.buttonBarItemFont = UIFont(name: "Helvetica", size: 16.0)!
        settings.style.buttonBarItemTitleColor = .gray
        
        // Sets the pager strip item offsets
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        // Sets the height and colour of the slider bar of the selected pager tab
        settings.style.selectedBarHeight = 3.0
        settings.style.selectedBarBackgroundColor = #colorLiteral(red: 0.1643726826, green: 0.5449098349, blue: 0.5535590649, alpha: 1)
        
        // Changing item text color on swipe
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = #colorLiteral(red: 0.6901267767, green: 0.6902446747, blue: 0.6901112795, alpha: 1)
            newCell?.label.textColor = #colorLiteral(red: 0.3993381858, green: 0.4123505652, blue: 0.4321975112, alpha: 1)
        }
    }

}
