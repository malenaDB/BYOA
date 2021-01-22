//
//  MeditationVC.swift
//  BYOA
//
//  Created by Malena on 1/22/21.
//  Copyright © 2021 MDB. All rights reserved.
//

import UIKit

class MeditationVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
   
    @IBOutlet weak var timePickerView: UIPickerView!
    
    @IBOutlet weak var secondsLabel: UILabel!
    
    @IBOutlet weak var minutesLabel: UILabel!
    
    var selectedMinutes = 0
    var totalMinutes = 0
    
    var selectedSeconds = 0
    var totalSeconds = 0
    
    var total = 0
    
    var timer = Timer()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        timePickerView.delegate = self
        timePickerView.dataSource = self
    }
    
    
    @objc func counter()
       {
           total -= 1
           createMinutesSeconds()
           setTimerLabel()
           
//           if total <= 0
//           {
//               resetTimer()
//           }
       }
    
    func createMinutesSeconds()
    {
        totalMinutes = total / 60
        totalSeconds = total % 60
    }
    
    func setTimerLabel()
    {
       secondsLabel.text = String(totalSeconds) + " Seconds"
       minutesLabel.text = String(totalMinutes) + " Minutes"
    }
    
    
    
    
    
    
    
    
    
    
    // MARK: Set-up the picker views.
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 2
    }
    
    // set the number of rows in each pickerview
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return 60 // there need to be 60 rows because this includes the number 0, and this will make the pickerview go up to 59
    }
    
    // set the text that will be in each row of the pickerview
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return String(row) // the label for each row will be whatever row number it is, but just written as a string
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if component == 0
        {
            totalMinutes = row
        }
        else
        {
            totalSeconds = row
        }
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton)
    {
        print(selectedMinutes)
        print(selectedSeconds)
        
        total = (totalMinutes * 60) + totalSeconds
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
    }
    
}


