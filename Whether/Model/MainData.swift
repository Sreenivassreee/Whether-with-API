//
//  MainData.swift
//  Whether
//
//  Created by Sreenivas k on 02/04/21.
//

import Foundation

struct MainData :Decodable{
    let name: String
    let main: Main
    let weather:[Weather]
}


struct Main:Decodable {
    let temp:Double
}
struct Weather:Decodable {
    let description:String
    let id:Double
}
