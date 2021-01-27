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
    
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var minutesLbl: UILabel!
    @IBOutlet weak var secondsLbl: UILabel!
    
    @IBOutlet weak var timerMinutesLabel: UILabel!

    @IBOutlet weak var timerSecondsLabel: UILabel!
    
    
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
        
        showPickerAndLblsAndStartButton()
        hideTimerLabels()
        hideStopAndResetButtons()
        startButton.isHidden = false
    }
    
    
    func createMinutesSeconds()
    {
        totalMinutes = total / 60
        totalSeconds = total % 60
    }
    
    func setTimerLabel()
    {
        timerSecondsLabel.text = String(totalSeconds) + " Seconds"
        timerMinutesLabel.text = String(totalMinutes) + " Minutes"
        
    }
    
    func resetTimer()
    {
        timer.invalidate()
        createMinutesSeconds()
        hideTimerLabels()
    
        showPickerAndLblsAndStartButton()
    }
    
    func hidePickerAndLblsAndStartButton()
    {
        timePickerView.isHidden = true
        minutesLbl.isHidden = true
        secondsLbl.isHidden = true
        startButton.isHidden = true
    }
    
    func showPickerAndLblsAndStartButton()
    {
        timePickerView.isHidden = false
        minutesLbl.isHidden = false
        secondsLbl.isHidden = false
        startButton.isHidden = false
    }
    
    func hideTimerLabels()
    {
        timerMinutesLabel.isHidden = true
        timerSecondsLabel.isHidden = true
    }
    
    func hideStopAndResetButtons()
    {
        stopButton.isHidden = true
        resetButton.isHidden = true
    }
    
    func showStopAndResetButtons()
    {
        stopButton.isHidden = false
        resetButton.isHidden = false
    }
    
    
    @objc func counter()
    {
        total -= 1
        createMinutesSeconds()
        setTimerLabel()
                
        if total <= 0
        {
            resetTimer()
        }
    }

    
    @IBAction func startButtonTapped(_ sender: UIButton)
    {
        total = (totalMinutes * 60) + totalSeconds
      
        timerMinutesLabel.isHidden = false
        timerSecondsLabel.isHidden = false
        
        showStopAndResetButtons()
        hidePickerAndLblsAndStartButton()
        
        setTimerLabel()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton)
    {
        timer.invalidate()
        print("timer should invalidate here")
        total = 0
        
        hideTimerLabels()
        hideStopAndResetButtons()
        showPickerAndLblsAndStartButton()
        startButton.isHidden = false
        
        print("reset button tapped")
    }
    
    
    @IBAction func stopButtonTapped(_ sender: UIButton)
    {
        timer.invalidate()
        startButton.isHidden = false
        print("stopbuttontapped")
    }
    
    

    
    // MARK: Set-up the picker view.
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 4
    }
    
    // set the number of rows in each pickerview
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if component == 0 || component == 2
        {
            return 60 // there need to be 60 rows because this includes the number 0, and this will make the pickerview go up to 59
        }
        else
        {
            return 0
        }
    }
    
    // set the text that will be in each row of the pickerview
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if component == 0 || component == 2
        {
            return String(row) // the label for each row will be whatever row number it is, but just written as a string
        }
        else
        {
            return ""
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if component == 0
        {
            totalMinutes = row
        }
        else if component == 2
        {
            totalSeconds = row
        }
    }
}


