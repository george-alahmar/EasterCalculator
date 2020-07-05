//
//  ViewController.swift
//  EasterCalculator
//
//  Created by George Alahmar on 6/28/20.
//  Copyright © 2020 George Alahmar. All rights reserved.
//

import UIKit

class ByYearViewController: UIViewController {

    var yearArray = [Int]()
    
    @IBOutlet weak var yearInputTextField: UITextField!
    
    @IBOutlet weak var julianEasterLabel: UILabel!
    
    @IBOutlet weak var westernEasterLabel: UILabel!
    
    @IBOutlet weak var orthodoxEasterLabel: UILabel!
    

    
    @IBOutlet weak var triodonLabel: UILabel!
    @IBOutlet weak var firstSatOfSoulsLabel: UILabel!
    @IBOutlet weak var meatFareLabel: UILabel!
    @IBOutlet weak var secondSatOfSoulsLabel: UILabel!
    @IBOutlet weak var lentBeginLabel: UILabel!
    @IBOutlet weak var thirdSatOfSoulsLabel: UILabel!
    @IBOutlet weak var sunOfOrthodoxyLabel: UILabel!
    @IBOutlet weak var satOfLazarosLabel: UILabel!
    @IBOutlet weak var palmSundayLabel: UILabel!
    @IBOutlet weak var goodFridayLabel: UILabel!
    
    
    @IBOutlet weak var ascensionLabel: UILabel!
    @IBOutlet weak var satOfSoulsLabel: UILabel!
    @IBOutlet weak var pentecostLabel: UILabel!
    @IBOutlet weak var allSaintsLabel: UILabel!
    
    
    @IBOutlet weak var triodonIntervalLabel: UILabel!
    @IBOutlet weak var pentecostIntervalLabel: UILabel!
    @IBOutlet weak var octoechosLabel: UILabel!
    
    var yearPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yearPickerView.delegate = self
        yearPickerView.dataSource = self
        yearInputTextField.inputView = yearPickerView
        
        
        // generate year array
        
        for y in 1583...4099 {
            yearArray.append(y)
        }
        
        // set the current year as the default value
    
        
        let currentYear = Calendar.current.component(.year, from: Date())
        let currentYearIndex = yearArray.firstIndex(of: currentYear)
        
        yearInputTextField.text = String(currentYear)
        yearPickerView.selectRow(currentYearIndex!, inComponent: 0, animated: true)
        displayEaster(year: currentYear)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPicker(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func dismissPicker (_ sender: UITapGestureRecognizer) {
            yearInputTextField.resignFirstResponder()
    }
    
    
    func displayEaster(year:Int){
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "nl_NL")
        formatter.setLocalizedDateFormatFromTemplate("d MMM")
        
        let julianEaster = EasterHelper.getJulianEaster(year: year)
        julianEasterLabel.text = formatter.string(from: julianEaster)
        
        let westernEaster = EasterHelper.getWesternEaster(year: year)
        westernEasterLabel.text = formatter.string(from: westernEaster)
        
        let orthodoxEaster = EasterHelper.getOrthodoxEaster(julianDate: julianEaster)
        orthodoxEasterLabel.text = formatter.string(from: orthodoxEaster)
        
        displayDetails(orthodoxEaster: orthodoxEaster)
    }
    
    
    func displayDetails(orthodoxEaster:Date){
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "nl_NL")
        formatter.setLocalizedDateFormatFromTemplate("d MMM")
        
        triodonLabel.text = formatter.string(from: orthodoxEaster.AddDays(days: -70))
        firstSatOfSoulsLabel.text = formatter.string(from: orthodoxEaster.AddDays(days: -57))
        meatFareLabel.text = formatter.string(from: orthodoxEaster.AddDays(days: -56))
        secondSatOfSoulsLabel.text = formatter.string(from: orthodoxEaster.AddDays(days: -50))
        lentBeginLabel.text = formatter.string(from: orthodoxEaster.AddDays(days: -48))
        thirdSatOfSoulsLabel.text = formatter.string(from: orthodoxEaster.AddDays(days: -43))
        sunOfOrthodoxyLabel.text = formatter.string(from: orthodoxEaster.AddDays(days: -42))
        satOfLazarosLabel.text = formatter.string(from: orthodoxEaster.AddDays(days: -8))
        palmSundayLabel.text = formatter.string(from: orthodoxEaster.AddDays(days: -7))
        goodFridayLabel.text = formatter.string(from: orthodoxEaster.AddDays(days: -2))
        ascensionLabel.text = formatter.string(from: orthodoxEaster.AddDays(days: 39))
        satOfSoulsLabel.text = formatter.string(from: orthodoxEaster.AddDays(days: 48))
        pentecostLabel.text = formatter.string(from: orthodoxEaster.AddDays(days: 49))
        allSaintsLabel.text = formatter.string(from: orthodoxEaster.AddDays(days: 56))
        
    
        triodonIntervalLabel.text =  triodonLabel.text! + " - " + formatter.string(from: orthodoxEaster.AddDays(days: -1))
        pentecostIntervalLabel.text = formatter.string(from:orthodoxEaster) + " - " + allSaintsLabel.text!
        octoechosLabel.text = formatter.string(from: orthodoxEaster.AddDays(days: 7))
        
        
    }
}

extension ByYearViewController : UIPickerViewDelegate , UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return yearArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        String(yearArray[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        yearInputTextField.text = String(yearArray[row])
        yearInputTextField.resignFirstResponder()
         displayEaster(year: yearArray[row])
    }
}
