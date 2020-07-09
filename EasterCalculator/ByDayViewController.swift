//
//  ByDayViewController.swift
//  EasterCalculator
//
//  Created by George Alahmar on 7/1/20.
//  Copyright © 2020 George Alahmar. All rights reserved.
//
import UIKit

class ByDayViewController: UIViewController {
    
    @IBOutlet weak var dateInputTextField: UITextField!
    @IBOutlet weak var dayNameLabel: UILabel!
    @IBOutlet weak var toneLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dayCaptionLabel: UILabel!
    @IBOutlet weak var lordFeastLabel: UILabel!
    
    @IBOutlet weak var statusImageView: UIImageView!
    
    
    private var datePicker:UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        
    }
    
    
    func createDatePicker(){
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        dateInputTextField.inputView = datePicker
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneBtn], animated: true)
        dateInputTextField.inputAccessoryView = toolBar
    }
    
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "nl_NL")
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        
        displayDetails()
        
        dateInputTextField.text = formatter.string(from: datePicker!.date)
        dateInputTextField.resignFirstResponder()
    }
    
    
    
    func displayDetails() {
        let date = datePicker?.date
        if date != nil{
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year], from: date!)
            let year = components.year!
            
            let orthodoxEaster = EasterHelper.getOrthodoxEaster(julianDate: EasterHelper.getJulianEaster(year: year))
            
            let octoechos = orthodoxEaster.AddDays(days: 7)
            
            // find tone
            if ((date! >= "\(year)-1-6".toDate()) && (date! < "\(year)-1-13".toDate()) && (calendar.dateComponents([.weekday], from: "\(year)-1-6".toDate()).weekday == 1))
                ||
                ((date! >= "\(year)-8-6".toDate()) && (date! < "\(year)-8-13".toDate()) && (calendar.dateComponents([.weekday], from: "\(year)-8-6".toDate()).weekday == 1))
                ||
                ((date! >= "\(year)-9-14".toDate()) && (date! < "\(year)-9-21".toDate()) && (calendar.dateComponents([.weekday], from: "\(year)-9-14".toDate()).weekday == 1))
                ||
                ((date! >= "\(year)-12-25".toDate()) && (date! < "\(year)-12-31".toDate()) && (calendar.dateComponents([.weekday], from: "\(year)-12-25".toDate()).weekday == 1))
                ||
                ((date! >= orthodoxEaster.AddDays(days: -7)) && (date! < orthodoxEaster.AddDays(days: 14))  )
                ||
                ((date! >= orthodoxEaster.AddDays(days: 49)) && (date! < orthodoxEaster.AddDays(days: 56))  )
            {
                toneLabel.text = "Of the Feast"
            }
            else
            {
                if date! < octoechos {
                    let lastEaster = EasterHelper.getOrthodoxEaster(julianDate: EasterHelper.getJulianEaster(year: year - 1))
                    let lastOctoechos = lastEaster.AddDays(days: 7)
                    let diffInWeeks = Calendar.current.dateComponents([.weekOfYear], from: lastOctoechos, to: octoechos).weekOfYear
                    
                    for i in 1...diffInWeeks! {
                        if ((date! >= lastOctoechos) && (date! < lastOctoechos.AddDays(days: i * 7))){
                            toneLabel.text = EasterHelper.getTone(toneNumer: i % 8)
                            break
                        }
                    }
                }
                else
                {
                    let nextEaster = EasterHelper.getOrthodoxEaster(julianDate: EasterHelper.getJulianEaster(year: year + 1))
                    let nextOctoechos = nextEaster.AddDays(days: 7)
                    let diffInWeeks = Calendar.current.dateComponents([.weekOfYear], from: octoechos, to: nextOctoechos).weekOfYear
                    for i in 1...diffInWeeks! {
                        if ((date! >= octoechos) && (date! < octoechos.AddDays(days: i * 7))){
                            toneLabel.text = EasterHelper.getTone(toneNumer: i % 8)
                            break
                        }
                    }
                }
            }
            
            
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            dayNameLabel.text = dateFormatter.string(from: date!)
            dayCaptionLabel.text = EasterHelper.getEasterRelatedDays(easterDate: orthodoxEaster, inputDate: date!)
            
            lordFeastLabel.text = EasterHelper.getLordFeast(inputDate: date!)
            
            
            let triodonStart = orthodoxEaster.AddDays(days: -70)
            let pentecostarionEnd = orthodoxEaster.AddDays(days: 56)
            if ( (date! >= triodonStart) && (date! < orthodoxEaster)){
                periodLabel.text = "Triodon Interval"
            }
            else if((date! > orthodoxEaster) && (date! <= pentecostarionEnd)){
                periodLabel.text = "Pentecostarion Interval"
            }
            else{
                periodLabel.text = "Normal Interval"
            }
            
            statusLabel.text = EasterHelper.getFast(easter: orthodoxEaster, inputDate: date!)
            
            
            // display image
            switch statusLabel.text {
            case "Strict Fast","Fast":
                statusImageView.image = UIImage(named: "fast")
            case "Fast/Dairy and Eggs Allowed":
                 statusImageView.image = UIImage(named: "cheese")
            case "Fast/Fish Allowed":
                 statusImageView.image = UIImage(named: "fish")
            case "Fast/Wine and Oil Allowed":
                 statusImageView.image = UIImage(named: "wine")
            default:
                 statusImageView.image = nil
            }
            
            
        }
    }
    
    
}

