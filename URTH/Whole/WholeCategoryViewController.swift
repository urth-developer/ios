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
    var categoryIndex: Int = 1
    var categoryChallenges: [CategoryChallenge] = []
    @IBOutlet weak var tableView: UITableView!
    
    let userdefault = UserDefaults.standard
    var idx = 1
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        idx = userdefault.integer(forKey: "currentCategoryIndex")
        switch idx {
        case 1:
            self.navigationItem.title = "일회용품"
            break
        case 2:
            self.navigationItem.title = "대기"
            break
        case 3:
            self.navigationItem.title = "자원"
            break
        case 4:
            self.navigationItem.title = "수질"
            break
        case 5:
            self.navigationItem.title = "생태계"
            break
        default:
            break
        }
                
        getCategoryList()
        
        
    }
    
}

// TableView

extension WholeCategoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryChallenges.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "WholeCategory1TableViewCell", for: indexPath) as! WholeCategory1TableViewCell
            headerView = cell.contentView
            
            idx = userdefault.integer(forKey: "currentCategoryIndex")
            print("index!!!!!:\(idx)")
            switch idx {
            case 1:
                cell.mainImageView.image = #imageLiteral(resourceName: "photoDisposable")
                break
            case 2:
                cell.mainImageView.image = #imageLiteral(resourceName: "imgAtmos")
                break
            case 3:
                cell.mainImageView.image = #imageLiteral(resourceName: "imgResource")
                break
            case 4:
                cell.mainImageView.image = #imageLiteral(resourceName: "photoWater")
                break
            case 5:
                cell.mainImageView.image = #imageLiteral(resourceName: "photoEcosystem")
                break
            default:
                cell.mainImageView.image = #imageLiteral(resourceName: "photoDisposable")
                break
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "WholeCategory2TableViewCell", for: indexPath) as! WholeCategory2TableViewCell
            cell.mainImage.kf.setImage(with: URL(string: categoryChallenges[indexPath.row-1].image), placeholder: UIImage())
            cell.title.text = categoryChallenges[indexPath.row-1].name
            
            if let creator = categoryChallenges[indexPath.row-1].creator{
                cell.nickName.text = creator
            }else{
                cell.nickName.text = "URTH"
            }
            
            cell.count.text = "총 \(categoryChallenges[indexPath.row-1].count)회"

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


//Network

extension WholeCategoryViewController{
    func getCategoryList(){
        WholeService.categoryChallengeList(idx: "\(categoryIndex)") { (challenges) in
            print("카테고리별 챌린지 리스트 조회 성공!!")
            self.categoryChallenges = challenges
            self.tableView.reloadData()
        }
    }
}
