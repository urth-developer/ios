//
//  WholeCategoryViewController.swift
//  URTH
//
//  Created by 장용범 on 08/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class WholeCategoryViewController: UIViewController {
    
    var headerView: UIView?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

// TableView

extension WholeCategoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "WholeCategory1TableViewCell", for: indexPath) as! WholeCategory1TableViewCell
            headerView = cell.contentView
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "WholeCategory2TableViewCell", for: indexPath) as! WholeCategory2TableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 209
        }else{
            return 128
        }
    }
    
    
}

// Collapsed

extension WholeCategoryViewController{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = headerView, scrollView.contentOffset.y >= 0, scrollView.contentOffset.y <= 209 else {return}
        UIView.animate(withDuration: 0.3) {
            header.alpha = 1.0 - scrollView.contentOffset.y/209
        }
    }
    
    private func setPosition(_ scrollView: UIScrollView){
        print(scrollView.contentOffset.y)
        UIView.animate(withDuration: 0.3) {
            
            if scrollView.contentOffset.y > 0 && scrollView.contentOffset.y < 104{
                scrollView.contentOffset = .zero
            }else if scrollView.contentOffset.y >= 104 && scrollView.contentOffset.y <= 209{
                scrollView.contentOffset.y = 209.0
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setPosition(scrollView)
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate{
            setPosition(scrollView)
        }
    }
}

