//
//  AddPost.swift
//  SDSC-Wifire
//
//  Created by Eric Fakhourian on 4/19/17.
//  Copyright © 2017 Eric Fakhourian. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class AddPost: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var titleFld: UITextField!
    @IBOutlet weak var descFld: UITextField!

    @IBOutlet weak var postImg: UIImageView!
    
    @IBOutlet weak var postItBtn: UIButton!
    
    
    var imagePicker: UIImagePickerController!
    
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImg.layer.cornerRadius = 15.0 //postImg.frame.size.width / 2
        postImg.clipsToBounds = true
        postItBtn.layer.cornerRadius = 4
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        //for location
        self.locationManger.requestAlwaysAuthorization()
        self.locationManger.requestWhenInUseAuthorization()
        
        //if location is enabled
        if CLLocationManager.locationServicesEnabled() {
            locationManger.delegate = self
            locationManger.desiredAccuracy = kCLLocationAccuracyBest
            locationManger.startUpdatingLocation()
        }
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        

        // Do any additional setup after loading the view.
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func addPicBtn(_ sender: UIButton!) {
        //let picker = UIImagePickerController()
        //picker.delegate = self
        //picker.sourceType = .camera
        imagePicker.sourceType = .camera
        sender.setTitle("", for: .normal)
        present(imagePicker, animated: true, completion: nil)
        
    }

    @IBAction func makePostBtnPressed(_ sender: Any) {
        if let title = titleFld.text, let desc = descFld.text, let img = postImg.image {
            
            let imgPath = DataService.instance.saveImageAndCreatePath(img)
            
            let post = Post(imagePath: imgPath, title: title, description: desc)
            DataService.instance.addPost(post)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
//        imagePicker.dismiss(animated: true, completion: nil)
//        postImg.image = image
//    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismiss(animated: true, completion: nil)
        postImg.image = image
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var userLocation:CLLocation = locations[0] as! CLLocation
        manager.startUpdatingLocation()
        
        let coordinations = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        //or i can have seprate 
    //    let long = userLocation.coordinate.longitude
      //  let lat = userLocation.coordinate.latitude
    
        
    }
    
}
