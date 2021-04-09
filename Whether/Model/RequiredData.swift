//
//  RequiredData.swift
//  Whether
//
//  Created by Sreenivas k on 03/04/21.
//

import Foundation

struct RequiredData {
    let temp:Double
    let cityName:String
    let des:String
    let id: Int
    var tempString:String {
        return String(format:" %.1f", temp)
    }
    var condition : String {
        switch id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
        
        
    }
    
}

