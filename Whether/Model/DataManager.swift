//
//  DataManager.swift
//  Whether
//
//  Created by Sreenivas k on 02/04/21.
//

import Foundation
import CoreLocation

protocol DataManagerDelegate {
    func didUpdateWeather(_ weather:RequiredData)
    func didFailWithError(_ error:Error)
}

struct DataManager {
    var baseUrlL:String="https://api.openweathermap.org/data/2.5/weather?&appid=3c20e0d804976a631bfb593d7ccaea50&units=metric"
    
    var delegate:DataManagerDelegate?
    
    
    
    
    func fetchData(city:String) {
        let finalUrl=baseUrlL+"&q="+city
        getData(url:finalUrl)
    }
    
    func fetchData(lan l: CLLocationDegrees,lon lo:CLLocationDegrees ) {
        let finalUrl=baseUrlL+"&lat=\(l)&lon=\(lo)"
        getData(url:finalUrl)
    }
    func getData(url url:String){
        let url = URL(string: url)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                self.delegate?.didFailWithError(error as! Error)
                print(error!.localizedDescription)
            } else {
                do {
                    if let dataa = data{
                        if let whether = parsedJsonData(dataa){
                            self.delegate?.didUpdateWeather(whether)
                            
                        }
                    }
                }catch let error as NSError {
                    self.delegate?.didFailWithError(error)
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func parsedJsonData(_ parsedData:Data)->RequiredData? {
        let decoder = JSONDecoder()
        do{
            let decodedData =  try  decoder.decode(MainData.self, from: parsedData)
            let requiredData = RequiredData(temp: decodedData.main.temp, cityName: decodedData.name, des: decodedData.weather[0].description, id: Int(decodedData.weather[0].id))
            return requiredData
        }catch{
            
            self.delegate?.didFailWithError(error)
            return nil
        }
    }
    
}

