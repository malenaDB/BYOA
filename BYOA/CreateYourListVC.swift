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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
        loadFromUserDefaults()
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
        let current = headers[section]
        return current.items.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        let current = headers[section] // if you're in section 0, you get header 0
    
        return current.title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let currentHeader = headers[indexPath.section]
        let currentItem = currentHeader.items[indexPath.row]
        cell.textLabel?.text = currentItem.text
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 45.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let frame = listTableView.frame

        // create buttons
        let headerPlusButton = UIButton(frame: CGRect(x: frame.width - 65, y: 15, width: 22.5, height: 22.5))
        headerPlusButton.tag = section
        
        let headerTrashButton = UIButton(frame: CGRect(x: frame.width - 30, y: 10, width: 22.5, height: 30))
        headerTrashButton.tag = section

        
        // set the image for the button
        headerPlusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        headerTrashButton.setImage(UIImage(systemName: "trash"), for: .normal)

        // create custom view for the header and adjust the size & background color
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        headerView.backgroundColor = UIColor.systemGray5
        
        // add the buttons to the view
        headerView.addSubview(headerPlusButton)
        headerView.addSubview(headerTrashButton)
        
        // add the target so the button can be tapped later and an action can be added to it
        headerPlusButton.addTarget(self, action: #selector(headerPlusButtonAction(_:)), for: .touchUpInside)
        headerTrashButton.addTarget(self, action: #selector(headerTrashButtonAction(_:)), for: .touchUpInside)
    
        let currentTitle = headers[section]

        let label = UILabel(frame: CGRect(x: 20, y: 7.5, width: frame.size.width - 50, height: 30))
        label.text = currentTitle.title
        headerView.addSubview(label)
        return headerView
    }
    
    
    // this is the action for when the + button in the header is tapped
    @objc func headerPlusButtonAction(_ sender:UIButton!)
    {
        print("Header button tapped")
        let section = sender.tag
        addCellAlert(section: section)
    }
    
    @objc func headerTrashButtonAction(_ sender:UIButton!)
    {
        print("Trash button tapped")
        let section = sender.tag
            
        // create alert that appears when trash button is pressed
        let deleteSectionAlert = UIAlertController(title: "Are you sure you want to delete this list?", message: "Once a list is deleted, it cannot be restored.", preferredStyle: .alert)
        
        // create the button on the alert that will delete the section/list (the header and all of its cells)
        let deleteButton = UIAlertAction(title: "Delete List", style: .destructive, handler: {
            action in
            
            // write code here for what happens when the user taps the "delete" button on the alert
            self.headers.remove(at: section)
            self.listTableView.reloadData()
            
            // save the new data
            self.saveToUserDefaults()
            
            // reload the table
            self.listTableView.reloadData()
            
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        present(deleteSectionAlert, animated:true, completion: nil)
        
        // add the buttons to the alert.
        deleteSectionAlert.addAction(deleteButton)
        deleteSectionAlert.addAction(cancelButton)
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
            let newHeader = Header(title: cellNameTF.text ?? "New List", items: [])
            
            self.headers.append(newHeader)
            
            self.saveToUserDefaults()
            
            // reload the table
            self.listTableView.reloadData()
            
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // add the buttons to the alert.
        addHeaderAlert.addAction(submitButton)
        addHeaderAlert.addAction(cancelButton)
        
        present(addHeaderAlert, animated:true, completion: nil)
    }
    
    

    
    
    func addCellAlert(section: Int)
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
            self.headers[section].items.append(newCell)
             
//             self.saveData() // this will save the new data to the device after we have appended the newAssignment to the assignments array
            
            self.saveToUserDefaults()
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
    
    // this function will make it so the user can swipe on the cell to delete it.
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            headers[indexPath.section].items.remove(at: indexPath.row)
           // headers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            saveToUserDefaults()
        } else if editingStyle == .insert
        {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    
    // MARK: Create functions to save data to user defaults
    func saveToUserDefaults()
    {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(headers)
        {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "SavedList")
        }
    }
    
    func loadFromUserDefaults()
    {
        if let savedList = UserDefaults.standard.object(forKey: "SavedList") as? Data
        {
            let decoder = JSONDecoder()
            if let loadedList = try? decoder.decode([Header].self, from: savedList)
            {
                self.headers = loadedList
            }
        }
    }
}



