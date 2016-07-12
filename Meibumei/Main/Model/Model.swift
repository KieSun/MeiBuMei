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
    var id: Int!
    var description: String!
    
    init(fromDictionary dictionary: NSDictionary){
        title = dictionary["title"] as? String
        imageUrl = dictionary["imageUrl"] as? String
        id = dictionary["id"] as? Int
        description = dictionary["description"] as? String
    }
}

struct Result {
    var userHead: String!
    var product: Product!
    var editorDesc: String!
    
    init(fromDictionary dictionary: NSDictionary){
        userHead = dictionary["userHead"] as? String
        editorDesc = dictionary["editorDesc"] as? String
        if let result = dictionary["product"] as? NSDictionary{
            product = Product(fromDictionary: result)
        }
    }
}

struct Product {
    var nickName: String!
    var title: String!
    var price: String!
    var imageUrls: String!
    
    init(fromDictionary dictionary: NSDictionary){
        nickName = dictionary["nickName"] as? String
        title = dictionary["title"] as? String
        price = dictionary["price"] as? String
        imageUrls = dictionary["imageUrls"] as? String
    }
}
