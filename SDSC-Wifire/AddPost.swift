//
//  AddPost.swift
//  SDSC-Wifire
//
//  Created by Eric Fakhourian on 4/19/17.
//  Copyright © 2017 Eric Fakhourian. All rights reserved.
//

import UIKit

class AddPost: UIViewController {
    @IBOutlet weak var postImg: UIButton!
    @IBOutlet weak var titleFld: UITextField!
    @IBOutlet weak var descFld: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImg.layer.cornerRadius = 15.0 //postImg.frame.size.width / 2
        postImg.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    @IBAction func addPicBtn(_ sender: UIButton) {
        sender.setTitle("", for: .normal)
    }

    @IBAction func makePostBtnPressed(_ sender: Any) {
        
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
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
