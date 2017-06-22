//
//  ViewController.swift
//  Mapannotation
//
//  Created by Toe Wai Aung on 6/13/17.
//  Copyright © 2017 kotoeymb. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    var monitoredRegions: Dictionary<String, Date> = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup locationManager
        locationManager.delegate = self;
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        // setup test data
        setupData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
 
        // status is not determined
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
            // authorization were denied
        else if CLLocationManager.authorizationStatus() == .denied {
            showAlert("Location services were previously denied. Please enable location services for this app in Settings.")
        }
            // we do have authorization
        else if CLLocationManager.authorizationStatus() == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
    func setupData() {
        // check if can monitor regions
//        ChildenLocationOutBound.sharedInstance.add(geotification: )
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            
            // region data
            let title = "Airyno"
            //            <wpt lat="16.775552" lon="96.14038">
            let coordinate = CLLocationCoordinate2DMake(16.775552, 96.14038)
            let regionRadius = 350
            
            
            // setup region
            let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: coordinate.latitude,
                                                                         longitude: coordinate.longitude), radius: CLLocationDistance(regionRadius), identifier: title)
            locationManager.startMonitoring(for: region)
            print("PrintRegion\(region)")
            // setup annotation
                }
        else {
            print("System can't track regions")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Comples business logic
    
    func updateRegionsWithLocation(_ location: CLLocation) {
        
        let regionMaxVisiting = 20.0
        var regionsToDelete: [String] = []
        
        for regionIdentifier in monitoredRegions.keys {
            if Date().timeIntervalSince(monitoredRegions[regionIdentifier]!) > regionMaxVisiting {
                showAlert("Thanks ")
                
                regionsToDelete.append(regionIdentifier)
            }
        }
        
        for regionIdentifier in regionsToDelete {
            monitoredRegions.removeValue(forKey: regionIdentifier)
        }
    }
    
    // MARK: - Helpers
    
    func showAlert(_ title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
}
// MARK : - CllocationMagr

extension ViewController : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        showAlert("enter \(region.identifier)")
        monitoredRegions[region.identifier] = Date()
         print("monitorregion\(monitoredRegions)")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        showAlert("exit \(region.identifier)")
        print("monitorregion\(monitoredRegions)")
        monitoredRegions.removeValue(forKey: region.identifier)
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        updateRegionsWithLocation(locations[0])
        
        if UIApplication.shared.applicationState == .active {
            guard locations.last != nil else {
                return
            }
            
            //      mapView.showAnnotations(self.locations, animated: true)
            //       print("App is Foreground",mostRecentLocation)
        } else {
            guard let mostRecentLocation = locations.last else {
                return
            }
            print("App is backgrounde. New location is %@", mostRecentLocation)
        }
    }

}

