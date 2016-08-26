//
//  ViewController.swift
//  MyAddress
//
//  Created by Ravi Shankar on 26/08/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import CoreLocation

class AddressViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var addressLabel: UILabel!
    
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customStyle()
        setupLocationManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refresh()
    }
    
    // MARK:- Custom Style
    
    func customStyle() {
        view.backgroundColor = backgroundColor
        
        addressLabel.font = standardTextFont
        addressLabel.textColor = textColor
        addressLabel.textAlignment = .center
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style:
            .plain, target: nil, action: nil)
    }
    
    // MARK:- Setup CLLocationManager
    
    func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- Refresh
    
    func refresh() {
        activityIndicator.startAnimating()
        locationManager?.startUpdatingLocation()
    }
    
    @IBAction func refreshButton(_ sender: UIButton) {
        refresh()
    }
}

extension AddressViewController: CLLocationManagerDelegate {
    
    // MARK:- Update Locations
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            let coordinate = locations[0].coordinate
            
            performUIUpdatesOnMain {
                self.addressLabel.text = String(coordinate.latitude.description + " " + coordinate.longitude.description )
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

