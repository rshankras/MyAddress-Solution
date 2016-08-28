//
//  TodayViewController.swift
//  Widget
//
//  Created by Ravi Shankar on 28/08/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import NotificationCenter
import CoreLocation
import MSLocationKit

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let defaults = UserDefaults(suiteName: "group.makeschool.MyCurrentAddress")
    var locationManager: CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLocationManager()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        activityIndicator.startAnimating()
        locationManager?.startUpdatingLocation()
        
        completionHandler(NCUpdateResult.newData)
    }
    
    // MARK:- Setup CLLocationManager
    
    func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
    }
    
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
}

extension TodayViewController: CLLocationManagerDelegate {
    // MARK:- Update Locations
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            performUIUpdatesOnMain {
                MSLocationService.getAddress(location: locations.first!, callback: { (address) in
                    self.addressLabel.text = address.addressBuilder(showTZ: self.isTimeZone())
                })
                self.activityIndicator.stopAnimating()
            }
            
        }
        performUIUpdatesOnMain {
            self.activityIndicator.stopAnimating()
        }
    }
    
    // MARK:- Location Fail
    
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        print(error.localizedDescription)
        
        performUIUpdatesOnMain {
            self.addressLabel.text = "error retrieving location information"
            self.activityIndicator.stopAnimating()
        }
    }
}
