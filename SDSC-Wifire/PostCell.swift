//
//  PostCell.swift
//  SDSC-Wifire
//
//  Created by Eric Fakhourian on 4/11/17.
//  Copyright © 2017 Eric Fakhourian. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var DescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

    func configureCell(post: Post){
        titleLabel.text = post.title
        DescLabel.text = post.postDescription
    }
    
}
