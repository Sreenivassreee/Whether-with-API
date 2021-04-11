//
//  ViewController.swift
//  Whether
//
//  Created by Sreenivas k on 29/03/21.
//

import UIKit
import CoreLocation
class ViewController: UIViewController{
    
    
    
    var datamanager = DataManager()
    var location = CLLocationManager()

    @IBOutlet weak var SearchFiledText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location.delegate = self
        location.requestWhenInUseAuthorization()
        location.requestLocation()
        
        
        
        SearchFiledText.delegate=self
        datamanager.delegate = self
    }
    
    @IBOutlet weak var WeatherConditionIcon: UIImageView!
    @IBOutlet weak var WeatherTemparature: UILabel!
    @IBOutlet weak var Location: UILabel!
    @IBAction func searchFiels(_ sender: UITextField) {
        //        print(sender.text!)
    }
    
    
  
    @IBAction func gio(_ sender: UIButton) {
        location.requestLocation()
    }
}


//MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate{
    @IBAction func SearchBtnPressed(_ sender: UIButton) {
        print(SearchFiledText.text!)
        if SearchFiledText.text != ""{
            datamanager.fetchData(city: SearchFiledText.text!)
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
            datamanager.fetchData(city: SearchFiledText.text!)
            SearchFiledText.text=""
        }else{
            SearchFiledText.placeholder="Please Enter City name"
        }
    }
}

//MARK: - DataManagerDelegate

extension ViewController : DataManagerDelegate{
    
    func didUpdateWeather(_ weather:RequiredData) {
        DispatchQueue.main.async {
            print(weather.cityName)
            self.Location.text=weather.cityName
            self.WeatherTemparature.text=weather.tempString
            self.WeatherConditionIcon.image=UIImage(systemName: weather.condition
            )
        }
}
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

extension ViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.last {
            location.stopUpdatingLocation()
            var lan = loc.coordinate.latitude
            var lon = loc.coordinate.longitude
            datamanager.fetchData(lan: lan, lon: lon)
           
        }
       
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
