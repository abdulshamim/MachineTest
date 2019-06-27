//
//  TopDevelopersModel.swift
//  MachineTest
//
//  Created by Abdul Shamim on 27/06/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import Foundation


class TopDeveloper {
    
    var name = ""
    var imagePath = ""
   
    var address = ""
    var avg_price = ""
    var year_estd = ""
    var total_properties_count = "0"
    
    init(json: [String: Any]) {
        
        if let value = json["developer_title"] as? String {
            self.name = value
        }
        
        if let value = json["developer_image"] as? String {
            self.imagePath = value
        }
        
        if let value = json["total_properties_count"] as? Int {
            self.total_properties_count = "\(value)"
        }
        
        if let value = json["year_estd"] as? String {
            self.year_estd = value + " " + "year estb."
        } else {
            self.year_estd = "year estb."
        }
        
    }
}
