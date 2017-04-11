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
    
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        var post = Post(imagePath: "", title: "Post 1", desc: "post 1 desc")
        var post2 = Post(imagePath: "", title: "Post 2", desc: "post 2 desc")
        var post3 = Post(imagePath: "", title: "Post 3", desc: "post 3 desc")
        
        posts.append(post)
        posts.append(post2)
        posts.append(post3)
        
        tableView.reloadData()
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
            cell.configureCell(post: post)
            return cell
        } else {
            let cell = PostCell()
            cell.configureCell(post: post)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    //select row to take you somewhere else.
    //func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    //    <#code#>
    //}
    

}

