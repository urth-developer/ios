//
//  ViewController.swift
//  URTH
//
//  Created by 장용범 on 03/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var label: UILabel!
    
    let attributedString = NSMutableAttributedString(string: """
3678명의 사람들과 함께
공기 34L를 깨끗하게 하고
나무 32그루를 살리고
동물 34마리와 함께하며
깨끗한 물 323L를 아끼고
바다거북 34마리를 살렸어요
어스에서는 작은 실천이 모여
큰 변화를 만듭니다
""")
    
    
    let picker = UIImagePickerController()
    
    fileprivate var items = [Character]()
    
    var cellCenter : CGPoint?
    
    var currentPage: Int = 0 {
        didSet {
            let character = self.items[self.currentPage]
        }
    }
    
    var pageSize: CGSize {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        pageSize.width += layout.minimumLineSpacing
        return pageSize
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = createItems()
        setupLayout()
        setLabel()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        picker.delegate = self
        picker.sourceType = .camera

    }
    
    
    func setupLayout() {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 30)
        
        pageControl.numberOfPages = 4
        
        
//        let bar: UINavigationBar! = self.navigationController?.navigationBar
//
//        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        bar.shadowImage = UIImage()
//        bar.backgroundColor = UIColor.clear
        
        
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
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UPCarouselCollectionViewCell", for: indexPath) as! UPCarouselCollectionViewCell
        let character = items[(indexPath as NSIndexPath).row]
        cell.image.image = UIImage(named: character.imageName)
        cellCenter = cell.center
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = items[(indexPath as NSIndexPath).row]
        let alert = UIAlertController(title: character.name, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        //present(alert, animated: true, completion: nil)
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
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineTableViewCell", for: indexPath) as! MagazineTableViewCell
            cell.title.text = "챌린지 제목"
            cell.name.text = "개설자"
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
        dismiss(animated: false, completion: nil)
        let vc = storyboard?.instantiateViewController(withIdentifier: "certificateNavi")
        present(vc!, animated: true, completion: nil)

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
