//
//  HomeDetailedCell.swift
//  Meibumei
//
//  Created by 俞诚恺 on 16/7/12.
//  Copyright © 2016年 Kie. All rights reserved.
//

import UIKit
import Kingfisher

class HomeDetailedCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    
    var model: Result? {
        didSet {
            iconImageView.kf_setImageWithURL(NSURL(string: model!.userHead ?? "")!)
            backImageView.kf_setImageWithURL(NSURL(string: model?.product.imageUrls ?? "")!)
            
            userNameLabel.text = model?.product.nickName
            titleLabel.text = model?.product.title
            desLabel.text = model?.editorDesc
            priceLabel.text = model?.product.price
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
