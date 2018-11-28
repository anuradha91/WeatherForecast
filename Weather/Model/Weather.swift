//
//  Weather.swift
//  WeatherDemo
//
//  Created by Anuradha Sharma on 11/26/18.
//  Copyright © 2018 Anuradha Sharma. All rights reserved.
//

import Foundation
class Weather{
    
    let date : String?
    let info : String?
    let tempMax : String?
    let tempMin : String?
    let precip : String?
    
    init(content : [String:Any]) {
        
        let date = Date(timeIntervalSince1970: content["time"] as! TimeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        let localDate = dateFormatter.string(from: date)
        
        self.date   = localDate
        self.info   = content["summary"] as? String
        self.tempMax = String(content["temperatureLow"] as? Double ?? 0.0)
        self.tempMin = String(content["temperatureHigh"] as? Double ?? 0.0)
        self.precip = "\(String((content["precipProbability"] as? Double ?? 0.0) * 100))%"
    }

    
    class func fetchWeatherData(lat: Float, long: Float, completion: @escaping ([Weather]) -> Void){
        APIHandler.serverRequest(url: "https://api.darksky.net/forecast/\(DarkSkyKey)/\(lat),\(long)", completion: {(responseDict :[String : Any]) -> Void in
            
            if let daily = responseDict["daily"] as? [String : Any]{
                if let dataArray = daily["data"] as? [[String : Any]]{
                    var weather = [Weather]()
                     weather = dataArray.map {  Weather(content: $0)  }
                    completion(weather)
                }
            }
        })
    }
}
