//
//  PreSaleModel.swift
//  MachineTest
//
//  Created by Abdul Shamim on 27/06/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import Foundation

class PreSale {
    
    var name = ""
    var imagePath = ""
    var address = ""
    var price = ""
    
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
        
        if let value = json["starting_price"] as? Double {
            self.price = "$ " + "\(value)"
        }
        
        if let property_type = json["building_type"] as? [String: Any] {
            if let value = property_type["name_en"] as? String {
                self.name = value
            }
        
        }
        
    }
}
