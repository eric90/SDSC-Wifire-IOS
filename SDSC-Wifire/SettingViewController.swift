//
//  SettingViewController.swift
//  SDSC-Wifire
//
//  Created by Eric Fakhourian on 6/6/17.
//  Copyright © 2017 Eric Fakhourian. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var tableview: UITableView!
    
    
    
    var settings = ["Wi-fi Only"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
//        cell.textLabel?.text = settings[indexPath.row]
//        return cell
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        
        cell.textLabel?.text = "Hello Magic Switch buyers!"
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.clear
        
//        lightSwitch = UISwitch(frame: CGRectZero) as UISwitch
//        lightSwitch.on = false
//        lightSwitch.addTarget(self, action: "switchTriggered", forControlEvents: .ValueChanged );
//        
//        
//        
//        cell.accessoryView = lightSwitch
        
        return cell
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
