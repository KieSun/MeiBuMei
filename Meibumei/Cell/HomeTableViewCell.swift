//
//  HomeTableViewCell.swift
//  Meibumei
//
//  Created by 俞诚恺 on 16/7/11.
//  Copyright © 2016年 Kie. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {

    var model: MbmGroupList? {
        didSet {
            backImageView.kf_setImageWithURL(NSURL(string: model!.imageUrl ?? "")!)
            desLabel.text = model!.title
        }
    }
    
    @IBOutlet weak var backImageView: UIImageView!
    
    @IBOutlet weak var desLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.selectionStyle = .None
    }
    
}
