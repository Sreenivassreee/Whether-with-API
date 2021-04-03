//
//  ViewController.swift
//  Whether
//
//  Created by Sreenivas k on 29/03/21.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{
    
    var manager = DataManager()
    
    @IBOutlet weak var SearchFiledText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchFiledText.delegate=self
    }
    
    @IBAction func searchFiels(_ sender: UITextField) {
        print(sender.text!)
    }
    
    @IBAction func SearchBtnPressed(_ sender: UIButton) {
        print(SearchFiledText.text!)
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
    
    
}

