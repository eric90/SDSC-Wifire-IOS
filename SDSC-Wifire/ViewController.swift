//
//  ViewController.swift
//  SDSC-Wifire
//
//  Created by Eric Fakhourian on 4/11/17.
//  Copyright © 2017 Eric Fakhourian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var cameraBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        DataService.instance.loadPosts()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.onPostsLoaded(_:)), name: NSNotification.Name(rawValue: "postsLoaded"), object: nil)
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = DataService.instance.loadedPosts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
            cell.configureCell(post)
            return cell
        } else {
            let cell = PostCell()
            cell.configureCell(post)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 125.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }
    
    func onPostsLoaded(_ notif: AnyObject) {
        tableView.reloadData()
    }
    
    
    

}

