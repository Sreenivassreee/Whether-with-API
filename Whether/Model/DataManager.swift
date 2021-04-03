//
//  DataManager.swift
//  Whether
//
//  Created by Sreenivas k on 02/04/21.
//

import Foundation

struct DataManager {
    var baseUrlL:String="https://api.openweathermap.org/data/2.5/weather?&appid=3c20e0d804976a631bfb593d7ccaea50&units=metric"
    
    func fetchData(city:String) {
        let finalUrl=baseUrlL+"&q="+city
        let url = URL(string: finalUrl)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    
                    if let dataa=data{
                        let safe = String(data: dataa, encoding: .utf8)
//                        print(safe!)
                        self.parsedJsonData(parsedData: dataa)
                    }
                    
                    
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
            
        }.resume()
        //
        
        
        
        
    }
    
    func parsedJsonData(parsedData:Data) {
        let decoder = JSONDecoder()
        do{
         let decodedData =  try  decoder.decode(MainData.self, from: parsedData)
//            print(decodedData.weather[0].description)
            let requiredData = RequiredData(temp: decodedData.main.temp, cityName: decodedData.weather[0].description, id: Int(decodedData.weather[0].id))
            print(requiredData.cityName)
        }catch{
            print(error)
        }
        
    }
}
