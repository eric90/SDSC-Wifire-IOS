//
//  Post.swift
//  SDSC-Wifire
//
//  Created by Eric Fakhourian on 4/11/17.
//  Copyright © 2017 Eric Fakhourian. All rights reserved.
//

import Foundation

class Post {
    //private variables
    private var _imagePath: String!
    private var _title: String!
    private var _postDescription: String!
    
    var imagePath: String {
        
        return _imagePath
    }
    var title: String {
        return _title
    }
    var postDescription: String {
        return _postDescription
    }
    
    init(imagePath: String, title: String, desc: String) {
        self._imagePath = imagePath
        self._title = title
        self._postDescription = desc
    }
    
}
