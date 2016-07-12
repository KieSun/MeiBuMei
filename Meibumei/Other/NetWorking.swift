//
//  NetWorking.swift
//  GFXCF
//
//  Created by 俞诚恺 on 16/6/27.
//  Copyright © 2016年 sun. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkTool: NSObject {
    
    typealias successClouse = (json: JSON) -> Void
    typealias failurlClouse = (error: NSError) -> Void
    
    static func getRequest(urlString: String, parameters: [String: AnyObject]? = nil,success: successClouse, failurl: failurlClouse) {
        
        Alamofire.request(.GET, urlString, parameters: parameters, encoding: .URL, headers: nil).validate().responseJSON { response in
            
            switch response.result {
            case .Success:
                if let json = response.result.value {
                    let json = JSON(json)
                    
                    success(json: json)
                }
                
            case .Failure(let error):
                
                failurl(error: error)
            }
        }
    }
    
    static func postRequest(urlString: String, parameters: [String: AnyObject]? = nil,success: successClouse, failurl: failurlClouse) {
        Alamofire.request(.POST, urlString, parameters: parameters, encoding: .URL, headers: nil).validate().responseJSON { response in
            
            switch response.result {
            case .Success:
                if let json = response.result.value {
                    let json = JSON(json)
                    
                    success(json: json)
                }
                
            case .Failure(let error):
                
                failurl(error: error)
            }
        }
    }
}
