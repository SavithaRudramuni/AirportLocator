//
//  AirportRadipService.swift
//  AirportFinder
//
//  Created by Savitha Rudramuni on 20/11/19.
//  Copyright © 2019 Savitha Rudramuni. All rights reserved.
//

import Foundation


class AirportRadipService {
    
    
    func serarchNearchByAirport(latitude:Float, longitude:Float,closue:@escaping(_ data:Data?, _ error:NSError?)->()) {
        
        let headers = [
            "x-rapidapi-host": "cometari-airportsfinder-v1.p.rapidapi.com",
            "x-rapidapi-key": "619822c654msh31e555788abca8ap115518jsn4107b8d2a72e"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://cometari-airportsfinder-v1.p.rapidapi.com/api/airports/nearest?lng=\(longitude)&lat=\(latitude)")! as URL,
            cachePolicy: .useProtocolCachePolicy,
        timeoutInterval: 10.0)


        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print("Error", error!)
               
            } else {
                let httpResponse = response as? HTTPURLResponse
                
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
