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
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = ""
        
        picker.delegate = self
        picker.sourceType = .photoLibrary
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectPhoto))
        imageView.addGestureRecognizer(gesture)

        
    }
    
    @objc func selectPhoto(){
        print("selectPhoto")
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func reselect(_ sender: Any) {
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func next(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Create5ViewController") as! Create5ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

// ImagePicker

extension Create4ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            self.imageView.image = image
            
        }
        
        dismiss(animated: true, completion: nil)
        
    }
}