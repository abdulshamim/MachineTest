//
//  BlogsModel.swift
//  MachineTest
//
//  Created by Abdul Shamim on 27/06/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import Foundation

class Blogs {
    
    var name = ""
    var imagePath = ""
    var publish_date = ""
    
    init(json: [String: Any]) {
        
        if let value = json["title_es"] as? String {
            self.name = value
        }
        
        if let value = json["image"] as? String {
            self.imagePath = value
        }
        
        if let value = json["publish_date"] as? String {
            self.publish_date = "Dated " + value
        }
    }
}
