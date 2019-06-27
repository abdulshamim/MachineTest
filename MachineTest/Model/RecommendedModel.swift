//
//  RecommendedModel.swift
//  MachineTest
//
//  Created by Abdul Shamim on 26/06/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import Foundation

class Recommended {
    var name = ""
    var imagePath = ""
    var property_type = ""
    var address = ""
    var avg_price = ""
    var locality = ""
    
    init(json: [String: Any]) {
        
        if let value = json["name"] as? String {
            self.name = value
        }
        
        if let value = json["image"] as? String {
            self.imagePath = value
        }
        
        if let property_type = json["locality"] as? [String: Any] {
            if let value = property_type["name_en"] as? String {
                self.locality = value
            }
        }
        if let property_type = json["property_type"] as? [String: Any] {
            if let value = property_type["name_en"] as? String {
                self.property_type = value
            }
        }
        if let property_type = json["building"] as? [String: Any] {
            if let value = property_type["name"] as? String {
                self.name = value
            }
            if let value = property_type["main_image"] as? String {
                self.imagePath = value
            }
            if let value = property_type["address"] as? String {
                self.address = value
            }
            if let value = property_type["avg_price"] as? Double {
                self.avg_price = "$ \(value)"
            }
        }
        
    }
}
