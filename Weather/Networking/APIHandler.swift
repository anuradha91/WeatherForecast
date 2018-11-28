//
//  APIHandler.swift
//  WeatherDemo
//
//  Created by Anuradha Sharma on 11/26/18.
//  Copyright © 2018 Anuradha Sharma. All rights reserved.
//

import Foundation
import Alamofire

class APIHandler {
    
    class func serverRequest(url : String, completion: @escaping ([String : Any]) -> Void){
        
        Alamofire.request(url).responseJSON { response in
            if let json = response.result.value {
                print("JSON: \(json)")
                if json is [String : Any]{
                    completion(json as! [String : Any])
                }else{
                    completion([:])
                }
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
                
                
            }
        }
    }
}
