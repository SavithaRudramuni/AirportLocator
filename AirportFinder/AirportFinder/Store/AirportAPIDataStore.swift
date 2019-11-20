//
//  AirportAPIDataStore.swift
//  AirportFinder
//
//  Created by Savitha Rudramuni on 17/11/19.
//  Copyright © 2019 Savitha Rudramuni. All rights reserved.
//

import Foundation


class AirportAPIDataStore:AirportSearchDataStore {
    
    let service:AirportService = AirportService()
    
    
    func serarchNearchByAirport(latitude:Float, longitude:Float,closure:@escaping (_ airports:[Airport]?, _ error:NSError?)->()) {
        
        service.serarchNearchByAirport(latitude: latitude,longitude: longitude) { (data:Data?, error:NSError?) in
            
            var airports:[Airport]?
            if let jsonData = data {
               airports  = try? JSONDecoder().decode([Airport].self, from: jsonData)
            }
            closure(airports,error)
        }
        
    }
    
}
