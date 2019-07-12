//
//  Create4ViewController.swift
//  URTH
//
//  Created by 장용범 on 05/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class Create4ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let userdefault = UserDefaults.standard
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = ""
        
        picker.delegate = self
        picker.sourceType = .photoLibrary
        
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = #colorLiteral(red: 0.6901267767, green: 0.6902446747, blue: 0.6901112795, alpha: 1)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectPhoto))
        imageView.addGestureRecognizer(gesture)

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
    
    
    @objc func selectPhoto(){
        print("selectPhoto")
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func reselect(_ sender: Any) {
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func next(_ sender: Any) {
        if let image = imageView.image{
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "Create5ViewController") as! Create5ViewController
            
            vc.challengeImage = image
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}

// ImagePicker

extension Create4ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.contentMode = .scaleAspectFill
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            self.imageView.image = image
            
        }
        
        dismiss(animated: true, completion: nil)
        
    }
}
