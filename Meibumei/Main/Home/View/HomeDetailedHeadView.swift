//
//  HomeDetailedHeadView.swift
//  Meibumei
//
//  Created by 俞诚恺 on 16/7/12.
//  Copyright © 2016年 Kie. All rights reserved.
//

import UIKit
import Kingfisher

class HomeDetailedHeadView: UIView {

    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    var model: MbmGroupList? {
        didSet {
            headImageView.kf_setImageWithURL(NSURL(string: model!.imageUrl ?? "")!)
            titleLabel.text = model!.title
            desLabel.text = model!.description
        }
    }
}
