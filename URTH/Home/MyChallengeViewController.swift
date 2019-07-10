//
//  MyChallengeViewController.swift
//  URTH
//
//  Created by 장용범 on 10/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class MyChallengeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        let barbuttonItem = UIBarButtonItem(title: "편집", style: .plain, target: self, action: #selector(editMode))
        barbuttonItem.tintColor = #colorLiteral(red: 0.3993381858, green: 0.4123505652, blue: 0.4321975112, alpha: 1)
        
        self.navigationItem.rightBarButtonItem = barbuttonItem

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @objc func editMode(){
        if tableView.isEditing{
            self.navigationItem.rightBarButtonItem?.title = "편집"
            tableView.setEditing(false, animated: true)
        }else{
            self.navigationItem.rightBarButtonItem?.title = "완료"
            tableView.setEditing(true, animated: true)
        }
    }
    

}

extension MyChallengeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyChallengeTableViewCell", for: indexPath) as! MyChallengeTableViewCell
        
        cell.title.text = "한줄짜리 제목은 이렇게 됩니다"
        cell.nickName.text = "개설자이름은제한두기로"
        cell.count.text = "총 501회"
        cell.title.sizeToFit()
        cell.nickName.sizeToFit()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
}
