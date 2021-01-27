//
//  TodayViewController.swift
//  BYOATodayExtension
//
//  Created by Malena on 1/25/21.
//  Copyright © 2021 MDB. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding
{
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
      

    
    
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void))
    {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
