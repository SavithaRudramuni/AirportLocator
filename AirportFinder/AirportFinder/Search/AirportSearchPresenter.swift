//
//  AirportSearchPresenter.swift
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

protocol AirportSearchPresentationLogic
{
  func presentSearchResult(response: AirportSearch.Search.Response)
    
    func presentNearByAirport(response: AirportSearch.NearBy.Response)
}

class AirportSearchPresenter: AirportSearchPresentationLogic
{
    func presentSearchResult(response: AirportSearch.Search.Response) {
        
//        let viewModel = AirportSearch.Search.ViewModel(name: "a", code: "a")
//        viewController?.displaySearchResult(viewModel: viewModel)
    }
    
    func presentNearByAirport(response: AirportSearch.NearBy.Response) {
        
//        let viewModel = AirportSearch.Search.ViewModel(name: "a", code: "a")
//        viewController?.displaySearchResult(viewModel: viewModel)
        
        viewController?.displayResult(viewModel: response)
    }
    
  weak var viewController: AirportSearchDisplayLogic?
  
  // MARK: Do something
  
  func presentSearchResult(response: AirportSearch.NearBy.Response)
  {
    //let viewModel = AirportSearch.Search.ViewModel(name: "a", code: "a")
    viewController?.displayResult(viewModel: response)
  }
    
    
}