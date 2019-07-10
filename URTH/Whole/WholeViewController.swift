//
//  WholeViewController.swift
//  URTH
//
//  Created by 장용범 on 03/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit
import Floaty

class WholeViewController: UIViewController, FloatyDelegate {

    @IBOutlet weak var tableView: UITableView!
    var challenges: [Challenge] = []
    var floaty = Floaty()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         layoutFAB()
        

        let searchButton = UIBarButtonItem(image: #imageLiteral(resourceName: "btnSearch"), style: .plain, target: self, action: #selector(search))
        searchButton.tintColor = #colorLiteral(red: 0.1643726826, green: 0.5449098349, blue: 0.5535590649, alpha: 1)
        self.navigationItem.rightBarButtonItem = searchButton
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initChallenges()
        self.navigationController?.title = "모두의 어스"

        //self.navigationController?.navigationBar.topItem?.title = "모두의 어스"

    }
    
    func layoutFAB() {
        
        floaty.buttonColor = #colorLiteral(red: 0.1643726826, green: 0.5449098349, blue: 0.5535590649, alpha: 1)
        floaty.openAnimationType = .none
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(create))
        floaty.addGestureRecognizer(gesture)
        
//        let item = FloatyItem()
//        item.hasShadow = false
//        item.buttonColor = UIColor.clear
//        item.circleShadowColor = UIColor.red
//        //        item.titleShadowColor = UIColor.blue
//        //        item.titleLabelPosition = .right
//        //        item.title = "titlePosition right"
//        item.handler = { item in
//
//        }
        
        floaty.hasShadow = false
        //floaty.addItem(item: item)
        floaty.paddingX = self.view.frame.width/2 - 180
        floaty.paddingY = self.view.frame.height/2 - 270
        floaty.fabDelegate = self
        
        self.view.addSubview(floaty)
        
    }
    
    @objc func create(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "CreateNavi")
        present(vc!, animated: true, completion: nil)
    }
    
//    func floatyWillOpen(_ floaty: Floaty) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "CreateNavi")
//        present(vc!, animated: true, completion: nil)
//    }
    
    func initChallenges(){
        challenges.append(Challenge(title: "가나다", name: "이사람", count: 10, image: #imageLiteral(resourceName: "monsters")))
        challenges.append(Challenge(title: "나다다", name: "저사람", count: 15, image: #imageLiteral(resourceName: "brave")))
        challenges.append(Challenge(title: "나라다", name: "그사람", count: 20, image: #imageLiteral(resourceName: "monsters")))
        challenges.append(Challenge(title: "가지마", name: "저사람", count: 30, image: #imageLiteral(resourceName: "wall-e")))
        challenges.append(Challenge(title: "다나피", name: "작성자", count: 5, image: #imageLiteral(resourceName: "nemo")))
        challenges.append(Challenge(title: "하나라", name: "이사람", count: 200, image: #imageLiteral(resourceName: "monsters")))
        challenges.append(Challenge(title: "바나다", name: "작성자", count: 116, image: #imageLiteral(resourceName: "buzz")))
        challenges.append(Challenge(title: "가가나다", name: "그사람", count: 30, image: #imageLiteral(resourceName: "monsters")))
        challenges.append(Challenge(title: "갑니나다", name: "저사람", count: 5000, image: #imageLiteral(resourceName: "wall-e")))
        challenges.append(Challenge(title: "크크나다", name: "작성자", count: 10, image: #imageLiteral(resourceName: "nemo")))
    }
    
    @objc func search(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "SearchTableViewController") as! SearchTableViewController
        vc.challenges = challenges
//        let vc = storyboard?.instantiateViewController(withIdentifier: "SearchPopupViewController") as! SearchPopupViewController
        
//        let transition = CATransition()
//        transition.duration = 0.3
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromBottom
//        view.window!.layer.add(transition, forKey: kCATransition)
//        present(vc!, animated: false, completion: nil)
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func showCategory(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "WholeCategoryViewController") as! WholeCategoryViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension WholeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return challenges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularTableViewCell", for: indexPath) as! PopularTableViewCell
        cell.mainImage.image = challenges[indexPath.row].image
        cell.titleLabel.text = challenges[indexPath.row].title
        cell.nameLabel.text = challenges[indexPath.row].name
        cell.countLabel.text = "총 \(challenges[indexPath.row].count)회"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}

extension WholeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let yVelocity = scrollView.panGestureRecognizer .velocity(in: scrollView).y
        
        if yVelocity > 0 {
            //print("up")
            scrollView.bounces = false
            
        } else if yVelocity < 0 {
            //print("down")
            scrollView.bounces = true
            
        }
        
    }
}

