//
//  MyChallengeTableViewCell.swift
//  URTH
//
//  Created by 장용범 on 10/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class MyChallengeTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var count: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
