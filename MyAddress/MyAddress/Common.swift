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

func performUIUpdatesOnMain(updates: @escaping () -> Void) {
    OperationQueue.main.addOperation { 
           updates()
    }
}
