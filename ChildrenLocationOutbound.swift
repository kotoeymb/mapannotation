//
//  ChildrenLocationOutbound.swift
//  Mapannotation
//
//  Created by Toe Wai Aung on 6/15/17.
//  Copyright © 2017 kotoeymb. All rights reserved.
//

import Foundation
import CoreLocation

class ChildenLocationOutBound {
    
    enum childSessionStatus {
        case emptyStatus
        case before30Minutes
        case fiveMinuteBefore35
        case timesUp
        }
    
    static let sharedInstance = ChildenLocationOutBound()
    
  /*
    // MARK: - Sessions
    func startSessionIfRequired(_ activeChildProfile:ActiveChildProfile?){
        
        self.activeChildProfile = activeChildProfile
        
        // TODO: DEBUG:
        //        resetRemainingSessionCount()
        //        resetEyeCalibration()
        
        // manage SessionPerDay count
        // if there is previous session,
        // - check if it's today
        // -- if today, do nothing
        // -- if not today, we reset the counter
        //
        // if there is previous session,
        // - check if has valid session count
        //
        // if there is no previou session,
        // - can be consider as fresh install, so we just start the session
        //
        
        if let d = activeChildProfile?.lastSessionStopsAt {
            
            // it's new day
            if d.isYesterday {
                resetRemainingSessionCount()
                resetEyeCalibration()
            }
            
            if doesHaveRemainingSession() {
                // continue
                sessionStarted()
            }else{
                // show popup
                showPopupIfRequired()
            }
            
        }else{
            
            // it's fresh install
            // so set max value
            resetRemainingSessionCount()
            resetEyeCalibration()
            
            sessionStarted()
        }
        
    }
    
   */
    // MARK: Functions that update the model/associated views with geotification changes
//    func add(geotification: Geotification) {
//        geotifications.append(geotification)
//        updateGeotificationsCount()
//    }
//    
//    func remove(geotification: Geotification) {
//        if let indexInArray = geotifications.index(of: geotification) {
//            geotifications.remove(at: indexInArray)
//        }
//        updateGeotificationsCount()
//    }
//    
//    func updateGeotificationsCount() {
////        title = "Geotifications (\(geotifications.count))"
//    }
   
    
    
}
//extension ChildenLocationOutBound : CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
//        showAlert("exit \(region.identifier)")
//        print("monitorregion\(monitoredRegions)")
//        geotifications.removeValue(forKey: region.identifier)
//    }
//}
