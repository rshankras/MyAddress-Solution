//
//  SettingsViewController.swift
//  MyAddress
//
//  Created by Ravi Shankar on 26/08/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    @IBOutlet weak var tzSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeTZSwitch(_ sender: AnyObject) {
        
    }
}
