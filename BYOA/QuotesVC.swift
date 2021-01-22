//
//  QuotesVC.swift
//  BYOA
//
//  Created by Malena on 1/21/21.
//  Copyright © 2021 MDB. All rights reserved.
//

import UIKit

class QuotesVC: UIViewController
{
    @IBOutlet weak var sorryLabel: UILabel!
    @IBOutlet weak var myTextView: UITextView!
    
    var affirmation = Affirmation(title: "test", section: 1, options: [])
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print(affirmation.title)
        affirmation.options.shuffle()
        
        if affirmation.section == 1
        {
            sorryLabel.text = "I'm so glad that you're feeling \(affirmation.title)!"
            myTextView.text = "\(affirmation.options[1])"
        }
        else
        {
            sorryLabel.text = "I'm so sorry that you're feeling \(affirmation.title)."
            myTextView.text = "\(affirmation.options[1])"
        }
    }
}
