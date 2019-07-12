//
//  ViewController.swift
//  URTH
//
//  Created by 장용범 on 03/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var nickName: UILabel!
    
    var attributedString = NSMutableAttributedString(string: """
3678명의 사람들과 함께
공기 34L를 깨끗하게 하고
나무 32그루를 살리고
동물 34마리와 함께하며
깨끗한 물 323L를 아끼고
바다거북 34마리를 살렸어요
어스에서는 작은 실천이 모여
큰 변화를 만듭니다
""")
    
    let userdefaults = UserDefaults.standard
    
    let picker = UIImagePickerController()
    
    var cellCenter : CGPoint?
    
    var currentPage: Int = 0 {
        didSet {
            let character = self.myFavoriteChallenges[self.currentPage]
        }
    }
    
    var pageSize: CGSize {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        pageSize.width += layout.minimumLineSpacing
        return pageSize
    }
    
    var myFavoriteChallenges: [FavoriteData] = []
    var todayChallenges: [TodayData] = []
    var currentFavoriteIndex: Int = 1
    
    let userdefault = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        print("-------------------------")
        getSummary()
        getFavoriteChallenge()
        getTodayChallenge()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        picker.delegate = self
        picker.sourceType = .camera
        
        if let userNickName = userdefaults.string(forKey: "nickname"){
            nickName.text = userNickName
            nickName.sizeToFit()
        }
                
    }
    
    
    func setupLayout() {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 30)
        
        pageControl.numberOfPages = 4
        
    }
    
    func setLabel() {
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = 13 // Whatever line spacing you want in points
        
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        label.attributedText = attributedString
        label.sizeToFit()
    }
    
    @IBAction func showMyChallenge(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MyChallengeViewController") as! MyChallengeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func createItems() -> [Character] {
        let characters = [
            Character(imageName: "wall-e", name: "Wall-E", movie: "Wall-E"),
            Character(imageName: "nemo", name: "Nemo", movie: "Finding Nemo"),
            Character(imageName: "ratatouille", name: "Remy", movie: "Ratatouille"),
            Character(imageName: "buzz", name: "Buzz Lightyear", movie: "Toy Story"),
            //            Character(imageName: "monsters", name: "Mike & Sullivan", movie: "Monsters Inc."),
            //            Character(imageName: "brave", name: "Merida", movie: "Brave")
        ]
        return characters
    }
    
    
    
}

// CollectionView

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myFavoriteChallenges.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UPCarouselCollectionViewCell", for: indexPath) as! UPCarouselCollectionViewCell
        let character = myFavoriteChallenges[(indexPath as NSIndexPath).row]
        cell.image.kf.setImage(with: URL(string: myFavoriteChallenges[indexPath.row].image), placeholder: UIImage())
        cell.name.text = myFavoriteChallenges[indexPath.row].name
        cell.name.sizeToFit()
        cellCenter = cell.center
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = myFavoriteChallenges[(indexPath as NSIndexPath).row]
        currentFavoriteIndex = myFavoriteChallenges[indexPath.row].challengeIdx
        userdefault.setValue(currentFavoriteIndex, forKey: "currentCertificateIndex")
        present(picker, animated: true, completion: nil)
    }
    
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
        pageControl.currentPage = currentPage
    }
    
}

// TableView

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todayChallenges.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineTableViewCell", for: indexPath) as! MagazineTableViewCell
        cell.title.text = todayChallenges[indexPath.row].name
        if let creator = todayChallenges[indexPath.row].creator{
            cell.name.text = creator
        }else{
            cell.name.text = "URTH"
        }
        cell.count.text = "8/100회"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
}

// ImagePicker

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{

            ChallengeService.certificateChallenge(idx: "\(self.currentFavoriteIndex)", image: image) { (message) in
                if message == "success"{
                    print("챌린지 인증 성공!!")
                    self.dismiss(animated: false, completion: nil)
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "certificateNavi")
                    let certificateVC = self.storyboard?.instantiateViewController(withIdentifier: "CertificateViewController") as! CertificateViewController
                    certificateVC.category = self.currentFavoriteIndex
                    self.present(vc!, animated: true, completion: nil)
                }else if message == "failure"{
                    print("챌린지 인증 실패!!")
                    self.dismiss(animated: false, completion: nil)
                    let alert = UIAlertController(title: "챌린지 인증 실패", message: "다시 시도해주세요", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
//                    self.dismiss(animated: false, completion: nil)
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "certificateNavi")
//                    self.present(vc!, animated: true, completion: nil)
                }
            }

        }

    }
}

// Disable Bounce

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let yVelocity = scrollView.panGestureRecognizer .velocity(in: scrollView).y
        
        if yVelocity > 0 {
            scrollView.bounces = false
            
        } else if yVelocity < 0 {
            scrollView.bounces = true
            
        }
        
    }
}

// Network

extension ViewController{
    func getSummary(){
        HomeService.summary { (data) in
            print("어스 요약 가져오기 성공!!")
            self.attributedString = NSMutableAttributedString(string: """
                \(data.totalUserCount)명의 사람들과 함께
                공기 \(data.authCountsByCategory.category1)L를 깨끗하게 하고
                나무 \(data.authCountsByCategory.category2)그루를 살리고
                동물 \(data.authCountsByCategory.category3)마리와 함께하며
                깨끗한 물 \(data.authCountsByCategory.category4)L를 아끼고
                바다거북 \(data.authCountsByCategory.category5)마리를 살렸어요
                어스에서는 작은 실천이 모여
                큰 변화를 만듭니다
                """)
            self.setLabel()
        }
    }
    
    func getFavoriteChallenge(){
        HomeService.favoriteChallenge { (data) in
            print("즐겨찾기 가져오기 성공!!")
            self.myFavoriteChallenges = data
            self.collectionView.reloadData()
        }
    }
    
    func getTodayChallenge(){
        HomeService.todayChallengeList { (data) in
            print("오늘의 챌린지 가져오기 성공!!")
            self.todayChallenges = data
            self.tableView.reloadData()
        }
    }
}
