//
//  GoogleFile.swift
//  ScoutMaster
//
//  Created by Aaron Pachesa on 2/13/20.
//  Copyright © 2020 Sam Roman. All rights reserved.
//

import Foundation

struct Outside: Codable {
    var results: [GeoCode]
}

struct GeoCode: Codable {
    var geometry: Geo
    
}

struct Geo: Codable {
    var location: Location
}

struct Location: Codable {
    var lat: Double?
    var lng: Double?
    
    static func getGeoCode(searchString: String, completionHandler: @escaping (Result<Location, AppError>) -> () ) {
        let urlStr = "https://maps.googleapis.com/maps/api/geocode/json?address=\(searchString)&key=\(Secrets.google_key)"
        NetworkManager.shared.fetchData(urlString: urlStr) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let geoCode = try JSONDecoder().decode(Location.self, from: data)
                    completionHandler(.success(geoCode))
                } catch let error {
                    print(error)
                    completionHandler(.failure(.badJSONError))                }
            }
        }
    }
    
}


    

    


