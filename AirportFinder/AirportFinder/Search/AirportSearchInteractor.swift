//
//  AirportSearchInteractor.swift
//  AirportFinder
//
//  Created by Savitha Rudramuni on 17/11/19.
//  Copyright (c) 2019 Savitha Rudramuni. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AirportSearchBusinessLogic
{
  func fetchNearByAirport(request: AirportSearch.NearBy.Request)
}

protocol AirportSearchDataStore
{
  func serarchNearchByAirport(latitude:Float, longitude:Float,closure:@escaping (_ airports:[Airport]?, _ error:NSError?)->())
}

class AirportSearchInteractor: AirportSearchBusinessLogic, AirportSearchDataStore
{
    func serarchNearchByAirport(latitude: Float, longitude: Float, closure: ([Airport]?, NSError?) -> ()) {
        
    }
    
    func fetchNearByAirport(request: AirportSearch.NearBy.Request) {
        worker = AirportSearchWorker()
        worker?.searchNearchByAirport(request: request, closure: { (response:AirportSearch.NearBy.Response, error:NSError?) in
            
            if response.airports != nil {
                self.presenter?.presentNearByAirport(response: response)
            }
            
        })
        
        
    }
    
  var presenter: AirportSearchPresentationLogic?
  var worker: AirportSearchWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func fetchNearByAirport(request: AirportSearch.Search.Request)
  {
    
  }
}
