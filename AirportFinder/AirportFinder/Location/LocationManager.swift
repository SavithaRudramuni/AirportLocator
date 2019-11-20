//
//  LocationManager.swift
//  AirportFinder
//
//  Created by Savitha Rudramuni on 17/11/19.
//  Copyright © 2019 Savitha Rudramuni. All rights reserved.
//

import Foundation
import CoreLocation


final class LocationManager:NSObject,CLLocationManagerDelegate {
   
    
    static let shared = LocationManager ()
    
    var coreLocationManger = CLLocationManager()
    
    var currentLocation:((CLLocation)->())?
    
    
    override init() {
        super.init()
        self.currentLocation =  nil
        self.coreLocationManger.delegate =  self
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("location manager authorization status changed")
        
        switch status {
        case .authorizedAlways:
            self.coreLocationManger.delegate =  self
            print("user allow app to get location data when app is active or in background")
        case .authorizedWhenInUse:
            self.coreLocationManger.delegate =  self
            print("user allow app to get location data only when app is active")
        case .denied:
            print("user tap 'disallow' on the permission dialog, cant get location data")
        case .restricted:
            print("parental control setting disallow location data")
        case .notDetermined:
            print("the location permission dialog haven't shown before, user haven't tap allow/disallow")
        @unknown default:
            print("the location permission dialog haven't shown before, user haven't tap allow/disallow")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed",error)
    }
    
    func retriveCurrentLocation(){
        let status = CLLocationManager.authorizationStatus()

        if(status == .denied || status == .restricted || !CLLocationManager.locationServicesEnabled()){
            // show alert to user telling them they need to allow location data to use some feature of your app
            return
        }

        // if haven't show location permission dialog before, show it to user
        if(status == .notDetermined){
            coreLocationManger.requestWhenInUseAuthorization()

            // if you want the app to retrieve location data even in background, use requestAlwaysAuthorization
            // locationManager.requestAlwaysAuthorization()
            return
        }
        
        // at this point the authorization status is authorized
        // request location data once
        coreLocationManger.requestLocation()
      
        // start monitoring location data and get notified whenever there is change in location data / every few seconds, until stopUpdatingLocation() is called
        // locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // .requestLocation will only pass one location to the locations array
        // hence we can access it by taking the first element of the array
        if let location = locations.first {
            self.currentLocation?(location)
            self.currentLocation =  nil
        }
    }
    
    
}
