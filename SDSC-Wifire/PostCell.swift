//
//  PostCell.swift
//  SDSC-Wifire
//
//  Created by Eric Fakhourian on 4/11/17.
//  Copyright © 2017 Eric Fakhourian. All rights reserved.
//
// This is the cell in the tableview
// Cells that you see the list of the images. 
// Each cell has this methods and constraints.

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var DescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImage.layer.cornerRadius = 15.0
        postImage.clipsToBounds = true
    }
    
    func configureCell(_ post: Post) {
        titleLabel.text = post.title
        DescLabel.text = post.postDesc
        postImage.image = DataService.instance.imageForPath(post.imagePath)
    }
    
}
