//
//  ShareAndBuyView.swift
//  Meibumei
//
//  Created by 俞诚恺 on 16/7/14.
//  Copyright © 2016年 Kie. All rights reserved.
//

import UIKit

class ShareAndBuyView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moreShareButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    var model: Result? {
        didSet {
            titleLabel.text = model!.product.title
            priceLabel.text = model!.product.price
            locationLabel.text = "所在地：\(model!.product.location)"
        }
    }
}
