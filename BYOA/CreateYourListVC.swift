//
//  CreateYourListVC.swift
//  BYOA
//
//  Created by Malena on 1/25/21.
//  Copyright © 2021 MDB. All rights reserved.
//

import UIKit

class CreateYourListVC: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        listTableView.delegate = self
        listTableView.dataSource = self
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem)
    {
        let addCellAlert = UIAlertController(title: "Add A New Item To Your List", message: "Fill out the form below to add a new item to your list.", preferredStyle: .alert)
         addCellAlert.addTextField(configurationHandler: { // create the textfield on the alert
            // adjust how the textfield will look
             textfield in
             textfield.placeholder = "Enter your text here"
         })
    
         // create the button on the alert that will submit the new assignment stuff
         let submitButton = UIAlertAction(title: "Add", style: .default, handler: {
             action in
             // write code here for what happens when the user taps the "submit" button on the alert
             
             // create the outlet for the text fields (TF) in the alert so then we can refer to them later
             let cellNameTF = addCellAlert.textFields![0]
             
             // MARK: create new assignment
             // note: we added ?? "" so that, if the user does not type anything into the text field and then presses submit, their assignment name will just say nothing because these are the defaults that we set.
            let newCell = CellText(text: cellNameTF.text ?? "")
                    
//             // append to assignments
//             self.assignments.append(newAssignment)
                    
             // reload the table
             self.listTableView.reloadData()
             
         })
         let cancelButton = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        // above, we created the buttons for the alert, but we never actually added them to the alert.  So, now we are adding the buttons to the alert.
         addCellAlert.addAction(submitButton)
         addCellAlert.addAction(cancelButton)

         present(addCellAlert, animated:true, completion: nil)
    }
    
    
    
    
    
    
    
    
    // MARK: Set up the table view.
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if section == 0
        {
            return "Section 1"
        }
        else if section == 1
        {
            return "Section 2"
        }
        else
        {
            return "Section 3"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0
        {
            return 5
        }
        else if section == 1
        {
            return 5
        }
        else
        {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        return cell
    }
}
