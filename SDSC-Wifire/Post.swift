//
//  Post.swift
//  SDSC-Wifire
//
//  Created by Eric Fakhourian on 4/11/17.
//  Copyright © 2017 Eric Fakhourian. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    
    fileprivate var _imagePath: String!
    fileprivate var _title: String!
    fileprivate var _postDesc: String!
    
    var imagePath: String {
        return _imagePath
    }
    
    var title: String {
        return _title
    }
    
    var postDesc: String {
        return _postDesc
    }
    
    init(imagePath: String, title: String, description: String) {
        self._imagePath = imagePath
        self._title = title
        self._postDesc = description
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObject(forKey: "imagePath") as? String
        self._title = aDecoder.decodeObject(forKey: "title") as? String
        self._postDesc = aDecoder.decodeObject(forKey: "description") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._imagePath, forKey: "imagePath")
        aCoder.encode(self._postDesc, forKey: "description")
        aCoder.encode(self._title, forKey: "title")
    }
}

