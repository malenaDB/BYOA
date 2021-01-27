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
    var headers = [Header]()
    var cells = [CellText]()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        listTableView.delegate = self
        listTableView.dataSource = self
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem)
    {
        print("addHeaderAlert should appear now")
        addHeaderAlert()
    }
    
    
    // MARK: Set up the table view.
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return headers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       // let current = headers[section]
       // return current.items.count
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        let current = headers[section] // if you're in section 0, you get header 0
    
        return current.title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        //let currentHeader = headers[indexPath.section]
        //let currentItem = currentHeader.items[indexPath.row]
        //cell.textLabel?.text = currentItem.text
        let currentCell = cells[indexPath.row]
        cell.textLabel?.text = currentCell.text
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let frame = listTableView.frame

        // create button
        let button = UIButton(frame: CGRect(x: frame.width - 30, y: 7, width: 15, height: 15))
        button.tag = section
        
        // set the image for the button
        button.setImage(UIImage(systemName: "plus"), for: .normal)

        // create custom view for the header and adjust the size & background color
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        headerView.backgroundColor = UIColor.systemGray5
        // add the button to the view
        headerView.addSubview(button)
        
        // add the target so the button can be tapped later and an action can be added to it
        button.addTarget(self, action: #selector(headerButtonAction(_:)), for: .touchUpInside)
        
        return headerView
        
        
        // let currentTitle = headers[section]

        // let label = UILabel(frame: CGRect(x: 20, y: 20, width: frame.size.width, height: frame.size.height))
        // label.text = currentTitle.title
        // return label
    }
    
    
    // this is the action for when the + button in the header is tapped
    @objc func headerButtonAction(_ sender:UIButton!)
    {
        print("Header button tapped")
        addCellAlert()
    }
    
    
    // MARK: Functions for making the alerts
    
    func addHeaderAlert()
    {
        let addHeaderAlert = UIAlertController(title: "Create A New List", message: "Fill out the form below to create a new list.", preferredStyle: .alert)
        addHeaderAlert.addTextField(configurationHandler: { // create the textfield on the alert
            // adjust how the textfield will look
            textfield in
            textfield.placeholder = "Enter your text here."
        })
        
        // create the button on the alert that will submit the new assignment stuff
        let submitButton = UIAlertAction(title: "Add", style: .default, handler: {
            action in
            // write code here for what happens when the user taps the "submit" button on the alert
            
            // create the outlet for the text fields (TF) in the alert so then we can refer to them later
            let cellNameTF = addHeaderAlert.textFields![0]
            
            // MARK: create new header
            // note: we added ?? "" so that "New List" is the default header text if the user writes nothign
            let newHeader = Header(title: cellNameTF.text ?? "New List", items: [CellText(text: "New Item")])
            
            self.headers.append(newHeader)
            
            // reload the table
            self.listTableView.reloadData()
            
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // add the buttons to the alert.
        addHeaderAlert.addAction(submitButton)
        addHeaderAlert.addAction(cancelButton)
        
        present(addHeaderAlert, animated:true, completion: nil)
    }
    
    
    func addCellAlert()
    {
        print("CELL ALERT should pop-up now")

        let addCellAlert = UIAlertController(title: "Add An Item To Your List", message: "Fill in the textfield with what you would like to add to your list!", preferredStyle: .alert)
         addCellAlert.addTextField(configurationHandler: { // create the textfield on the alert
            // adjust how the textfield will look
             textfield in
             textfield.placeholder = "Enter your text here."
         })
         // create the button on the alert that will submit the new assignment stuff
         let submitButton = UIAlertAction(title: "Add", style: .default, handler: {
             action in
             // write code here for what happens when the user taps the "submit" button on the alert
             
             // create the outlet for the text field (TF) in the alert so then we can refer to them later
             let cellTextTF = addCellAlert.textFields![0]
             
             // MARK: create new assignment
             // note: we added ?? "" so that, if the user does not type anything into the text field and then presses submit, their assignment name will just say nothing because these are the defaults that we set.
            let newCell = CellText(text: cellTextTF.text ?? ":)")
                    
             // append to cell array
            self.cells.append(newCell)  // FIGURE OUT HOW TO APPEND THE NEW CELL TO THE "ITEMS" STRUCT PART OF THE HEADER ARRAY
             
//             self.saveData() // this will save the new data to the device after we have appended the newAssignment to the assignments array
//
             // reload the table
             self.listTableView.reloadData()
             
         })
         let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        // above, we created the buttons for the alert, but we never actually added them to the alert.  So, now we are adding the buttons to the alert.
         addCellAlert.addAction(submitButton)
         addCellAlert.addAction(cancelButton)

         present(addCellAlert, animated:true, completion: nil)
    }
}



