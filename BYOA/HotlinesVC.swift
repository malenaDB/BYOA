//
//  HotlinesVC.swift
//  BYOA
//
//  Created by Malena on 1/21/21.
//  Copyright © 2021 MDB. All rights reserved.
//

import UIKit

class HotlinesVC: UIViewController, UITableViewDataSource, UITableViewDelegate
    
{
    @IBOutlet weak var hotlinesTableView: UITableView!
    
    var suicideHotlines = [Hotline]()
    var substanceAbuseHotlines = [Hotline]()
    var abuseHotlines = [Hotline]()
    var lgbtqHotlines = [Hotline]()
    
    var selectedHotline = Hotline(organization: "test organization", number: "test 1234567890")
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        hotlinesTableView.delegate = self
        hotlinesTableView.dataSource = self
        
        loadHotlines()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if section == 0
        {
            return "Suicide Prevention Hotlines"
        }
        else if section == 1
        {
            return "Substance Abuse Hotlines"
        }
        else if section == 2
        {
            return "Abuse Hotlines"
        }
        else
        {
            return "LGBTQ+ Hotlines"
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0
        {
            return suicideHotlines.count
        }
        else if section == 1
        {
            return substanceAbuseHotlines.count
        }
        else if section == 2
        {
            return abuseHotlines.count
        }
        else
        {
            return lgbtqHotlines.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myHotlineTableViewCell", for: indexPath)
        
        if indexPath.section == 0
        {
            let current = suicideHotlines[indexPath.row]
            cell.textLabel?.text = current.organization
            cell.detailTextLabel?.text = current.number
        }
        else if indexPath.section == 1
        {
            let current = substanceAbuseHotlines[indexPath.row]
            cell.textLabel?.text = current.organization
            cell.detailTextLabel?.text = current.number
        }
        else if indexPath.section == 2
        {
            let current = abuseHotlines[indexPath.row]
            cell.textLabel?.text = current.organization
            cell.detailTextLabel?.text = current.number
        }
        else if indexPath.section == 3
        {
            let current = lgbtqHotlines[indexPath.row]
            cell.textLabel?.text = current.organization
            cell.detailTextLabel?.text = current.number
        }
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.section == 0
        {
            selectedHotline = suicideHotlines[indexPath.row]
            print(selectedHotline.number)
            phoneCallAlert()
        }
        else if indexPath.section == 1
        {
            selectedHotline = substanceAbuseHotlines[indexPath.row]
            print(selectedHotline.number)
            phoneCallAlert()
        }
        else if indexPath.section == 2
        {
            selectedHotline = abuseHotlines[indexPath.row]
            print(selectedHotline.number)
            phoneCallAlert()
        }
        else if indexPath.section == 3
        {
            selectedHotline = lgbtqHotlines[indexPath.row]
            print(selectedHotline.number)
            phoneCallAlert()
        }
    }
    
    
    
    func callHotline(number: String)
    {
       // if let phoneCallURL = URL(string: "tel://\(number)")
        if let phoneCallURL = URL(string: "tel://6106421108")

        {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL))
            {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    func phoneCallAlert()
    {
        let phoneCallAlert = UIAlertController(title: "Confirm Phone Call", message: "Are you sure you want to call \(selectedHotline.organization)?", preferredStyle: .alert)
        
        phoneCallAlert.addAction(UIAlertAction(title: "Yes, call \(selectedHotline.organization).", style: .default, handler:{action in
            self.callHotline(number: "\(self.selectedHotline.number)")
        }))
        
        phoneCallAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(phoneCallAlert, animated: true)
    }
    
    
    
    //            selectedHotline = tableView.cellForRow(at: indexPath)
    //            let phoneCallAlert = UIAlertController(title: "Confirm Phone Call", message: "Are you sure you want to call ORGANIZATION?", preferredStyle: .alert)
    //
    //            phoneCallAlert.addAction(UIAlertAction(title: "Yes, call 1234567890.", style: .default, handler:
    //            {
    //                action in
    //                {
    //                    if let url = URL(string:"tel://\(selectedHotline.number)")
    //                    {
    //                        UIApplication.shared.openURL(url)
    //                    }
    //                }
    //            }))
    //
    //                phoneCallAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    //                self.present(phoneCallAlert, animated: true)
    //            }
    //
    
    
    
    
    

    
    
    
    
    func loadHotlines()
    {
        let nationalSuicidePrevention = Hotline(organization: "National Suicide Prevention Lifeline", number: "1-800-273-8255")
        suicideHotlines.append(nationalSuicidePrevention)
        
        let samhsaNationalSubstanceAbuse = Hotline(organization: "SAMHSA National Helpline", number: "1-800-662-4357")
        let ncaddNationalAlcoholDrug = Hotline(organization: "NCADD Hopeline", number: "1-800-622-2255")
        substanceAbuseHotlines.append(samhsaNationalSubstanceAbuse)
        substanceAbuseHotlines.append(ncaddNationalAlcoholDrug)
        
        let nationalDomesticViolence = Hotline(organization: "National Domestic Violence Hotline", number: "1-800-422-4453")
        let nationalChildAbuse = Hotline(organization: "Childhelp National Child Abuse Hotline", number: "1-800-422-4453")
        abuseHotlines.append(nationalDomesticViolence)
        abuseHotlines.append(nationalChildAbuse)
        
        let trevorProjectLifeline = Hotline(organization: "Trevor Project Lifeline", number: "1-866-7386")
        lgbtqHotlines.append(trevorProjectLifeline)
    }
    
}
