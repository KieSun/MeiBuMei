//
//  Model.swift
//  Meibumei
//
//  Created by 俞诚恺 on 16/7/11.
//  Copyright © 2016年 Kie. All rights reserved.
//

import UIKit

struct MbmGroupList {
    var title: String!
    var imageUrl: String!
    
    init(fromDictionary dictionary: NSDictionary){
        title = dictionary["title"] as? String
        imageUrl = dictionary["imageUrl"] as? String
    }
}
