//
//  Airport.swift
//  AirportFinder
//
//  Created by Savitha Rudramuni on 17/11/19.
//  Copyright © 2019 Savitha Rudramuni. All rights reserved.
//

import Foundation
import MapKit

struct APIResponse {
    
    let results:[Airport]
    
    enum CodingKeys: String, CodingKey {
        case results =  "results"
    }
}

extension APIResponse: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        results =  try values.decode([Airport].self, forKey: .results)
    
    }
}

struct Coordinate {
    var latitude: Double
    var longitude: Double

    enum CodingKeys: String, CodingKey {
        case latitude =  "latitude"
        case longitude =  "longitude"
    }
    
    enum CodingKeys1: String, CodingKey {
        case latitude =  "lat"
        case longitude =  "lng"
    }
    
}

extension Coordinate: Decodable {
    init(from decoder: Decoder) throws {
        
        
        let container1 = try decoder.container(keyedBy: CodingKeys.self)
        let container2 = try decoder.container(keyedBy: CodingKeys1.self)
        
        if container1.allKeys.contains(.latitude) ==  true {
            latitude = try container1.decode(Double.self, forKey: .latitude)
            longitude = try container1.decode(Double.self, forKey: .longitude)
        } else {
            latitude = try container2.decode(Double.self, forKey: .latitude)
                longitude = try container2.decode(Double.self, forKey: .longitude)
        }
        
        
    
    }
}

struct Geometry {
    let location:Coordinate
    
    enum CodingKeys: String, CodingKey {
        case locations =  "location"
    }
}

extension Geometry: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        location = try values.decode(Coordinate.self, forKey: .locations)
        
    }
}


struct Airport {
    let name:String
    var geometry: Geometry?
    var location: Coordinate?
    
   // let code:String
    
    enum CodingKeys: String, CodingKey {
        case name =  "name"
       case  location =  "location"
        case geometry = "geometry"
    }
   
}

extension Airport: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try values.decode(String.self, forKey: .name)
        location = try values.decodeIfPresent(Coordinate.self, forKey: .location)
        geometry = try values.decodeIfPresent(Geometry.self, forKey: .geometry)
        
        if location == nil && geometry != nil {
            location =  geometry?.location
        }
        
    }
}
