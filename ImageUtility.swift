//
//  ImageUtility.swift
//  
//
//  Created by Tanmoy on 15/04/17.
//  Copyright © 2017 Tanmoy Khanra. All rights reserved.
//

import UIKit
import Foundation

extension UIImageView{
    
    func fetchImageFromUrl(url:String) -> UIImage{
        
        
        let catPictureURL = URL(string: url)!
        
        let session = URLSession(configuration: .default)
        
        let cache = NSCache<AnyObject, AnyObject>()
        
        if (cache.object(forKey: "userProfilePic" as AnyObject) != nil){
            
            
            
        }else{
        
      
        let downloadPicTask = session.dataTask(with: catPictureURL) { (data, response, error) in
           
            if let e = error {
                
                print("Error downloading cat picture: \(e)")
                
                
            } else {
              
                if let res = response as? HTTPURLResponse {
                    
                    print("Downloaded cat picture with response code \(res.statusCode)")
                
                    if let imageData = data {
                        
                        self.image = UIImage(data: imageData)
                        
                        let img = UIImage(data:imageData)
                        
                        cache.setObject(img!, forKey: "userProfilePic" as AnyObject)
    
                
                    } else {
                        
                        print("Couldn't get image: Image is nil")
                    }
                    
                } else {
                    
                    print("Couldn't get response code for some reason")
                }
            }
        }
    
    
        downloadPicTask.resume()
    }
    
       return self.image!
        
    }
    
}
