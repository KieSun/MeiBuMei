//
//  PhotoBrowserCell.swift
//  Meibumei
//
//  Created by 俞诚恺 on 16/7/15.
//  Copyright © 2016年 Kie. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoBrowserCell: UICollectionViewCell {
    
    var imageView: UIImageView?
    
    var imageString: String? {
        didSet {
//            imageView?.kf_setImageWithURL(NSURL(string: imageString ?? "")!)
            imageView?.kf_setImageWithURL(NSURL(string: imageString ?? "")!, placeholderImage: nil, optionsInfo: nil, progressBlock: { (receivedSize, totalSize) in
                
                print(Double(totalSize / receivedSize))
                }, completionHandler: nil)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        imageView = UIImageView()
        addSubview(imageView!)
        
        imageView?.contentMode = .ScaleAspectFit
        imageView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self)
        })
    }
    
    
    

}
