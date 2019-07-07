//
//  SearchPopupViewController.swift
//  URTH
//
//  Created by 장용범 on 07/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class SearchPopupViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //blur()
        
        view.alpha = 0.5
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear

        searchController.searchBar.showsCancelButton = false
        searchController.searchBar.delegate = self
        searchController.searchBar.searchBarStyle = .minimal
    
        self.navigationItem.titleView = searchController.searchBar
        definesPresentationContext = true

        searchController.hidesNavigationBarDuringPresentation = false
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(done))

    }
    
    func blur(){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
    }

    @objc func done(){
        print("done!!")
        self.dismiss(animated: true, completion: nil)

    }

    
}


extension SearchPopupViewController: UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancle!!!!")
    }
    
}
