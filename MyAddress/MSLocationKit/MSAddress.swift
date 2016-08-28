//
//  MSAddress.swift
//  MyAddress
//
//  Created by Ravi Shankar on 27/08/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

public struct MSAddress {
    
    public let name: String
    public let locality: String
    public let postalCode: String
    public let country: String
    public let administrativeArea: String
    public let timeZone: TimeZone
    
    public func addressBuilder(showTZ:Bool) -> String {
        var addressString = name + ", "
            + locality + ", "
            + administrativeArea + ", "
            + country + ", "
            + postalCode + "\r\n"
        if showTZ {
            addressString += "\r\n"
            addressString += timeZone.identifier
        }
        return addressString
    }
}
