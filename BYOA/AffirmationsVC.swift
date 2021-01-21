//
//  AffirmationsVC.swift
//  BYOA
//
//  Created by Malena on 1/20/21.
//  Copyright © 2021 MDB. All rights reserved.
//

import UIKit

class AffirmationsVC: UIViewController, UITableViewDataSource, UITableViewDelegate
{
   

    @IBOutlet weak var myTableView: UITableView!
    
    var mySection1 = [Affirmation]()
    var mySection2 = [Affirmation]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        myTableView.delegate = self
        myTableView.dataSource = self
        
        loadAffirmations()
    }
    
    func loadAffirmations()
    {
        let happy = Affirmation(title: "happy", options: ["have a good day", "hooray", "awesome"])
        let excited = Affirmation(title: "excited", options: ["yay", "have a nice day", "you're awesome"])
        let sad = Affirmation(title: "sad", options: ["i hope your day gets better", "you're super cool", "it will be okay"])
        
        mySection1.append(happy)
        mySection1.append(excited)
        mySection2.append(sad)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if section == 0
        {
            return "+"
        }
        else
        {
            return "-"
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
       {
        if section == 0
        {
            return mySection1.count
        }
        else
        {
            return mySection2.count
        }
       
       }
       
    
    
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
       {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        if indexPath.section == 0
        {
            let current = mySection1[indexPath.row]
            cell.textLabel?.text = current.title
        }
        else
        {
            let current = mySection2[indexPath.row]
            cell.textLabel?.text = current.title
        }
    
        return cell
       }
       
    
}


