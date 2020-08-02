//
//  ViewController.swift
//  tip
//
//  Created by Melissa on 8/2/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import Foundation

class ViewController: UIViewController {
   
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    private var locationManager:CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        getUserLocation()
        billAmountTextField.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onTap(_ sender: Any) {
        print("Hello")
    }

    
    @IBAction func calculateTip(_ sender: Any) {
        
        // Get bill amount
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.20]
        
        // Calculate tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + bill
        
        // Update tip and total labels
        tipPercentageLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
    }
    
    func getUserLocation(){
        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
    }
}

