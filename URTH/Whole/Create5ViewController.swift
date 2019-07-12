//
//  Create5ViewController.swift
//  URTH
//
//  Created by 장용범 on 05/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class Create5ViewController: UIViewController {

    @IBOutlet weak var challengeImageView: UIImageView!
    @IBOutlet weak var challengeName: UILabel!
    @IBOutlet weak var challengeCategory: UILabel!
    @IBOutlet weak var challengeContent: UILabel!
    var challengeImage = UIImage()
    
    let userdefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let name = userdefault.string(forKey: "create_name") else {return}
        guard let content = userdefault.string(forKey: "create_content") else {return}
        challengeName.text = name
        challengeContent.text = content
        challengeImageView.image = challengeImage
        
        challengeName.sizeToFit()
        challengeCategory.sizeToFit()
        challengeContent.sizeToFit()
        
        switch userdefault.integer(forKey: "create_categoryIdx") {
        case 1:
            challengeCategory.text = "일회용품"
        case 2:
            challengeCategory.text = "대기"
        case 3:
            challengeCategory.text = "자원"
        case 4:
            challengeCategory.text = "수질"
        case 5:
            challengeCategory.text = "생태계"
        default:
            break
        }
    }
 
    @IBAction func complete(_ sender: Any) {
        createChallenge()
//        let vc = storyboard?.instantiateViewController(withIdentifier: "Create6ViewController") as! Create6ViewController
//        present(vc, animated: true, completion: nil)
    }
}

// Network

extension Create5ViewController{
    func createChallenge(){
        WholeService.createChallenge(name: gsno(challengeName.text), category: gsno(challengeCategory.text), explanation: gsno(challengeContent.text), image: challengeImage) { (message) in
            if message == "success"{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Create6ViewController") as! Create6ViewController
                self.present(vc, animated: true, completion: nil)
            }else{
                let alert = UIAlertController(title: nil, message: "챌린지 개설 실패했습니다..", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
