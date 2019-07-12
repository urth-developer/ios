//
//  OurFriendViewController.swift
//  URTH
//
//  Created by 장용범 on 08/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class OurFriendViewController: UIViewController, IndicatorInfoProvider {

    @IBOutlet weak var collectionView: UICollectionView!
    var friendList: [FriendData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    override func viewWillAppear(_ animated: Bool) {
        getFriendList()
        collectionView.setContentOffset(.zero, animated: false)
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "친구")
    }
    

}

extension OurFriendViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OurFriendCollectionViewCell", for: indexPath) as! OurFriendCollectionViewCell
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6959546233)
        if let image = friendList[indexPath.row].profileImg{
            cell.profileImage.kf.setImage(with: URL(string: image), placeholder: UIImage())
        }else{
            cell.profileImage.image = #imageLiteral(resourceName: "buzz")
        }
        
        cell.nickName.text = friendList[indexPath.row].nickname
        cell.level.text = "Level. \(friendList[indexPath.row].level)"

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
}

//Network

extension OurFriendViewController{
    func getFriendList(){
        OurService.friendList { (friends) in
            self.friendList = friends
            self.collectionView.reloadData()
        }
    }
}
