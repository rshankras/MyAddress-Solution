//
//  Common.swift
//  MyAddress
//
//  This contains the common code shared across the module.
//
//  Created by Ravi Shankar on 26/08/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation

let defaults = UserDefaults(suiteName: "group.makeschool.MyCurrentAddress")

func isTimeZone() -> Bool {
    var timeZone = false
    if defaults?.object(forKey: "timezone") != nil {
        timeZone = (defaults?.bool(forKey: "timezone"))!
    } else {
        timeZone = true
    }
    
    return timeZone
}

func performUIUpdatesOnMain(updates: @escaping () -> Void) {
    OperationQueue.main.addOperation { 
           updates()
    }
}

