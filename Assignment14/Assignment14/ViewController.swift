//
//  ViewController.swift
//  Assignment14
//
//  Created by Suhaas Choppavarapu on 9/6/20.
//  Copyright © 2020 Suhaas Choppavarapu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    //MARK:- IBOutlets
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var label: UILabel!
    
    //MARK:- Properties
    var months: [String] = ["Jan", "Feb", "Mar", "Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    
    var dates: [String] = ["1","2","3","4","5","6","7","8","9","10",
                           "11","12","13","14","15","16","17","18","19","20",
                           "21","22","23","24","25","26","27","28","29","30","31"]
    
    var years = ["2020", "2021"]
    
    var selectedMonthsRow: String = "Jan"
    var selectedDatesRow: String = "1"
    var selectedYearsRow: String = "2020"
    
    //MARK:- View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = selectedMonthsRow + "          " + selectedDatesRow + "          " + selectedYearsRow
    }
    
    //MARK:- UIPickerView Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return months.count
        case 1:
            return dates.count
        default:
            return years.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return months[row]
        case 1:
            return dates[row]
        default:
            return years[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            let value = months[row]
            selectedMonthsRow = value
            
            if value == "Feb" {
                
                dates = ["1" ,"2" ,"3" ,"4" ,"5" ,"6" ,"7" ,"8" ,"9" ,"10",
                         "11" ,"12" ,"13" ,"14" ,"15" ,"16" ,"17" ,"18" ,"19" ,"20",
                         "21", "22", "23" ,"24" ,"25" ,"26" ,"27", "28"]
                
                if selectedYearsRow == "2021" {
                    dates.append("29")
                }
                
            } else if value == "Apr" || value == "Jun" || value == "Sep" || value == "Nov"{
                dates = ["1" ,"2" ,"3" ,"4" ,"5" ,"6" ,"7" ,"8" ,"9" ,"10",
                         "11" ,"12" ,"13" ,"14" ,"15" ,"16" ,"17" ,"18" ,"19" ,"20",
                         "21", "22", "23" ,"24" ,"25" ,"26" ,"27", "28", "29", "30"]
            } else {
                dates = ["1" ,"2" ,"3" ,"4" ,"5" ,"6" ,"7" ,"8" ,"9" ,"10",
                         "11" ,"12" ,"13" ,"14" ,"15" ,"16" ,"17" ,"18" ,"19" ,"20",
                         "21", "22", "23" ,"24" ,"25" ,"26" ,"27", "28", "29", "30", "31"]
            }
            
            pickerView.reloadAllComponents()
            selectedDatesRow = ""
        }
        
        if component == 1 {
            let value = dates[row]
            selectedDatesRow = value
        }
        
        if component == 2 {
            let value = years[row]
            selectedYearsRow = value
            
            
            pickerView.reloadAllComponents()
        }
        
        label.text = selectedMonthsRow + "          " + selectedDatesRow + "          " + selectedYearsRow
    }
}


