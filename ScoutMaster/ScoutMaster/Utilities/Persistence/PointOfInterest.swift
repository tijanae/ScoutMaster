//
//  PointOfInterest.swift
//  ScoutMaster
//
//  Created by Sam Roman on 3/9/20.
//  Copyright © 2020 Sam Roman. All rights reserved.
//

import Foundation

struct PointOfInterest: Codable {
    
    let lat: Double
    let long: Double
    let type: String
    
    var id: String {
        let new = "\(lat)\(long)"
        return new.replacingOccurrences(of: "-", with: "")
    }
    
    
  
    
}
