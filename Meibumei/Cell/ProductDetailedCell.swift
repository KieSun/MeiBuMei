//
//  ProductDetailedCell.swift
//  Meibumei
//
//  Created by 俞诚恺 on 16/7/14.
//  Copyright © 2016年 Kie. All rights reserved.
//

import UIKit
import Kingfisher

class ProductDetailedCell: UITableViewCell {

    @IBOutlet weak var backImageView: UIImageView!
    
    var urlString: String? {
        didSet {
            
            backImageView.kf_setImageWithURL(NSURL(string: urlString ?? "")!)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
