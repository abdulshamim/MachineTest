//
//  NearbyPropertiesModel.swift
//  MachineTest
//
//  Created by Abdul Shamim on 27/06/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import Foundation

class NearbyProperties {
    
    var name = ""
    var imagePath = ""
    var address = ""
    var price = ""
    var type = ""
    
    init(json: [String: Any]) {
        
        if let value = json["name"] as? String {
            self.name = value
        }
        
        if let value = json["main_image"] as? String {
            self.imagePath = value
        }
        
        if let value = json["address"] as? String {
            self.address = value
        }
    }
}
