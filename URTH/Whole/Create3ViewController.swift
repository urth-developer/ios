//
//  Create3ViewController.swift
//  URTH
//
//  Created by 장용범 on 05/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class Create3ViewController: UIViewController,UITextViewDelegate {
    
    @IBOutlet weak var contentTextView: UITextView!
    
    let userdefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentTextView.text = "이곳에 이야기를 작성해주세요"
        contentTextView.textColor = UIColor.lightGray
        contentTextView.delegate = self
        self.navigationController?.navigationBar.topItem?.title = ""
        
        addCloseButton()
    }
    
    func addCloseButton(){
        let barbuttonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btnClose"), style: .plain, target: self, action: #selector(close))
        barbuttonItem.tintColor = #colorLiteral(red: 0.1643726826, green: 0.5449098349, blue: 0.5535590649, alpha: 1)
        self.navigationItem.rightBarButtonItem = barbuttonItem
    }
    
    @objc func close(){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func next(_ sender: Any) {
        if let content = contentTextView.text{
            userdefault.setValue(content, forKey: "create_content")
            let vc = storyboard?.instantiateViewController(withIdentifier: "Create4ViewController") as! Create4ViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    // textview delegate
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray{
            textView.text = nil
            textView.textColor = #colorLiteral(red: 0.3993381858, green: 0.4123505652, blue: 0.4321975112, alpha: 1)
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            textView.text = "이곳에 이야기를 작성해주세요"
            textView.textColor = UIColor.lightGray
        }
    }
}
