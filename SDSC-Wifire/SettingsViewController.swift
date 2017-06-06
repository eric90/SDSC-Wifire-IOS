//
//  SettingsViewController.swift
//  SDSC-Wifire
//
//  Created by Eric Fakhourian on 6/6/17.
//  Copyright © 2017 Eric Fakhourian. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var switchBtn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onOffSwitch(_ sender: Any) {
        if switchBtn.isOn {
            print("its on")
        } else {
            print("its off")
        }
        
    }
    

    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
//    func stateChanged(switchState: UISwitch) {
//        if switchBtn.isOn {
//            print("Switch is on")
//        } else {
//            print("Switch is off")
//        }
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
