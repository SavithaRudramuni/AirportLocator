//
//  AirportService.swift
//  AirportFinder
//
//  Created by Savitha Rudramuni on 17/11/19.
//  Copyright © 2019 Savitha Rudramuni. All rights reserved.
//

import Foundation




class AirportService {
    
    
    func serarchNearchByAirport(latitude:Float, longitude:Float,closue:@escaping(_ data:Data?, _ error:NSError?)->()) {
        
        //AIzaSyAJqCkRk8FhnsATzHauNdzsidYrZwiDsAI
        let request = NSMutableURLRequest(url: NSURL(string: "https://cometari-airportsfinder-v1.p.rapidapi.com/api/airports/nearest?lng=\(longitude)&lat=\(latitude)")! as URL,
            cachePolicy: .useProtocolCachePolicy,
        timeoutInterval: 10.0)

        if let url =  URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(latitude),\(longitude)&radius=500000&type=airport&key=AIzaSyAJqCkRk8FhnsATzHauNdzsidYrZwiDsAI") {
            let request = NSMutableURLRequest(url:url ,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
      //  request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print("Error", error!)
               
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                
                if let rData  =  data {
                              do{
                                  //here dataResponse received from a network request
                                  let jsonResponse = try JSONSerialization.jsonObject(with:
                                                         rData, options: [])
                                  print(jsonResponse) //Response result
                               } catch let parsingError {
                                  print("Error", parsingError)
                               }
                               }
            }
            
            closue(data,error as NSError?)
        })

        dataTask.resume()
        }
    }
}
