//
//  DataService.swift
//  SDSC-Wifire
//
//  Created by Eric Fakhourian on 4/19/17.
//  Copyright © 2017 Eric Fakhourian. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    static let instance = DataService()
    
    let KEY_POSTS = "posts"
    fileprivate var _loadedPosts = [Post]()
    
    var loadedPosts: [Post] {
        return _loadedPosts
    }
    
    func savePosts() {
        let postsData = NSKeyedArchiver.archivedData(withRootObject: _loadedPosts)
        UserDefaults.standard.set(postsData, forKey: KEY_POSTS)
        UserDefaults.standard.synchronize()
    }
    
    func loadPosts() {
        if let postsData = UserDefaults.standard.object(forKey: KEY_POSTS) as? Data {
            
            if let postsArray = NSKeyedUnarchiver.unarchiveObject(with: postsData) as? [Post] {
                _loadedPosts = postsArray
            }
        }
        
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "postsLoaded"), object: nil))
    }
    
    func saveImageAndCreatePath(_ image: UIImage) -> String {
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(Date.timeIntervalSinceReferenceDate).png"
        let fullPath = documentsPathForFileName(imgPath)
        try? imgData?.write(to: URL(fileURLWithPath: fullPath), options: [.atomic])
        return imgPath
    }
    
    func imageForPath(_ path: String) -> UIImage? {
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func addPost(_ post: Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
    func documentsPathForFileName(_ name: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.appendingPathComponent(name)
    }
    
}
