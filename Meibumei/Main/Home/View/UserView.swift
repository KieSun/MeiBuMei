//
//  UserView.swift
//  Meibumei
//
//  Created by 俞诚恺 on 16/7/14.
//  Copyright © 2016年 Kie. All rights reserved.
//

import UIKit
import Kingfisher

class UserView: UIView {

    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    var model: Result? {
        didSet {
            iconImageView.kf_setImageWithURL(NSURL(string: model!.userHead ?? "")!)
            userNameLabel.text = model!.product.nickName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = 15
    }
}
