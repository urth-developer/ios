//
//  CertificateAllCollectionViewCell.swift
//  URTH
//
//  Created by 장용범 on 09/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

protocol CertificateCellDelegate: class {
    func click(wasPressedOnCell cell: CertificateAllCollectionViewCell)
}

class CertificateAllCollectionViewCell: UICollectionViewCell {
    
    
    
    weak var delegate: CertificateCellDelegate?
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    
    @IBAction func click(_ sender: Any) {
        delegate?.click(wasPressedOnCell: self)
    }
    
}
