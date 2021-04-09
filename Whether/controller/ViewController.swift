//
//  ViewController.swift
//  Whether
//
//  Created by Sreenivas k on 29/03/21.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate, DataManagerDelegate{
    
    
    
    var manager = DataManager()
    
    @IBOutlet weak var SearchFiledText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SearchFiledText.delegate=self
        manager.delegate = self
    }
    
    @IBOutlet weak var WeatherConditionIcon: UIImageView!
    @IBOutlet weak var WeatherTemparature: UILabel!
    @IBOutlet weak var Location: UILabel!
    @IBAction func searchFiels(_ sender: UITextField) {
        //        print(sender.text!)
    }
    
    @IBAction func SearchBtnPressed(_ sender: UIButton) {
        print(SearchFiledText.text!)
        if SearchFiledText.text != ""{
            manager.fetchData(city: SearchFiledText.text!)
            SearchFiledText.text=""
        }else{
            SearchFiledText.placeholder="Please Enter City name"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SearchFiledText.endEditing(true)
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        SearchFiledText.endEditing(true)
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if SearchFiledText.text != ""{
            manager.fetchData(city: SearchFiledText.text!)
            SearchFiledText.text=""
        }else{
            SearchFiledText.placeholder="Please Enter City name"
        }
    }
    func didUpdateWeather(_ weather:RequiredData) {
        DispatchQueue.main.async {
            print(weather.cityName)
            self.Location.text=weather.cityName
            self.WeatherTemparature.text=weather.tempString
            self.WeatherConditionIcon.image=UIImage(systemName: weather.condition)
        }
        
        
    }
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

