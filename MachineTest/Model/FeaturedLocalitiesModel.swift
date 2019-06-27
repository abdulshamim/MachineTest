//
//  FeaturedLocalitiesModel.swift
//  MachineTest
//
//  Created by Abdul Shamim on 27/06/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import Foundation

class FeaturedLocalities {
    
    var name = ""
    var imagePath = ""
    var buildings_count = ""
    var price = ""
    var type = ""
    
    init(json: [String: Any]) {
        
        if let value = json["name"] as? String {
            self.name = value
        }
        
        if let value = json["price_per_sqft"] as? Int {
            self.price = "$ \(value)" + " / sqft."
        }
        
        if let value = json["buildings_count"] as? Int {
            self.buildings_count = "\(value)"
        }
    }
}
