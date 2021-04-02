//
//  DataManager.swift
//  Whether
//
//  Created by Sreenivas k on 02/04/21.
//

import Foundation

struct DataManager {
    var baseUrlL:String="https://api.openweathermap.org/data/2.5/weather?&appid=3c20e0d804976a631bfb593d7ccaea50"
    
    func fetchData(city:String) {
        let finalUrl=baseUrlL+"&q="+city
        print(finalUrl)
        
        let url = URL(string: finalUrl)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    
                    if let dataa=data{
                        var safe = String(data: dataa, encoding: .utf8)
                        print(safe)
                    }
                    
                    //                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! [[String : Any]]
                    //                    print(parsedData)
                    //                    for item in parsedData
                    //                    {
                    //                        let id = item["id"] as! String
                    //                        print(id)
                    //                    }
                    
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
            
        }.resume()
        //
        
        
        
    }
}
