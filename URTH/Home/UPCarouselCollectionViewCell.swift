//
//  UPCarouselCollectionViewCell.swift
//  URTH
//
//  Created by 장용범 on 03/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class UPCarouselCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = max(self.frame.size.width, self.frame.size.height) / 2
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor(red: 221.0/255.0, green: 228.0/255.0, blue: 194.0/255.0, alpha: 1.0).cgColor
    }
}
