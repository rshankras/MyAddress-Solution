//
//  MSLocationService.swift
//  MyAddress
//
//  Created by Ravi Shankar on 27/08/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import CoreLocation

public class MSLocationService: NSObject {
    
    public static func getAddress(location: CLLocation, callback: @escaping (_ myAddress:MSAddress) -> Void) {
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
            if let error = error {
                print(error)
            } else {
                if let placemarks = placemarks {
                    if let name = placemarks[0].name, let locality = placemarks[0].locality, let postalCode = placemarks[0].postalCode, let country =  placemarks[0].country, let administrativeArea = placemarks[0].administrativeArea, let timeZone = placemarks[0].timeZone {
                        
                        let address = MSAddress(name: name, locality: locality, postalCode: postalCode, country: country, administrativeArea: administrativeArea, timeZone: timeZone)
                        
                        callback(address)
                    }
                }
            }
        })
    }
}

