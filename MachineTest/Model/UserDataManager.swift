//
//  UserDataManager.swift
//  MachineTest
//
//  Created by Abdul Shamim on 26/06/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import UIKit

enum SectionType: Int, CaseIterable {
    case recommended
    case recommended_rent
    case top_developers
    case pre_sale
    case popular_projects
    case featured_localities
    case blogs
    case nearby_properties
    case nearby_properties_rent
}

class UserDataManager {
    
    var recommended = [Recommended]()
    var top_developers = [TopDeveloper]()
    var pre_sale = [PreSale]()
    var popular_projects = [PopularProjects]()
    var featured_localities = [FeaturedLocalities]()
    var blogs = [Blogs]()
    var nearbyProperties = [NearbyProperties]()
   // var nearby_properties_rent = [NearbyProperties]()
    
    init() {
    }
    
    // MARK : Get all data from server
    func fetchData(callBack : @escaping (_ isSuccess: Bool) -> Void) {
        
        let path = "https://apitest.sozu.com/api/user/home"
        print(path)
        
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        
        NetworkingClass(path: path,
                        method: .post)
            .config(activityIndicatorEnable: false)
            .connectServerWithoutImage(delay: 0){(_ response: Any?, data: Data?, error: Error?) in
                
                guard let response = response as? [String: Any],
                     let data = response["data"] as? [String: Any] else {
                    callBack(false)
                    return
                }
                
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
                self.parseData(json: data)
                //print(response)
                callBack(true)
        }
        
    }
    
    func parseData(json: [String: Any]) {
        if let recommendeds = json["recommended"] as? [[String: Any]] {
            for item in recommendeds {
                let object = Recommended(json: item)
                self.recommended.append(object)
            }
        }
        
        if let recommendeds = json["top_developers"] as? [[String: Any]] {
            for item in recommendeds {
                let object = TopDeveloper(json: item)
                self.top_developers.append(object)
            }
        }
        
        if let recommendeds = json["pre_sale"] as? [[String: Any]] {
            for item in recommendeds {
                let object = PreSale(json: item)
                self.pre_sale.append(object)
            }
        }
        
        if let recommendeds = json["popular_projects"] as? [[String: Any]] {
            for item in recommendeds {
                let object = PopularProjects(json: item)
                self.popular_projects.append(object)
            }
        }
        if let recommendeds = json["featured_localities"] as? [[String: Any]] {
            for item in recommendeds {
                let object = FeaturedLocalities(json: item)
                self.featured_localities.append(object)
            }
        }
        if let recommendeds = json["blogs"] as? [[String: Any]] {
            for item in recommendeds {
                let object = Blogs(json: item)
                self.blogs.append(object)
            }
        }
        if let recommendeds = json["nearby_properties"] as? [[String: Any]] {
            for item in recommendeds {
                let object = NearbyProperties(json: item)
                self.nearbyProperties.append(object)
            }
        }
    }
}
