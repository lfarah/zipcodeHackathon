//
//  BeaconTestViewController.swift
//  ZipcodeHackathon
//
//  Created by Lucas Farah on 11/7/15.
//  Copyright © 2015 Lucas Farah. All rights reserved.
//

import UIKit

class BeaconTestViewController: UIViewController,ESTBeaconManagerDelegate {
  // 2. Add a property to hold the beacon manager and instantiate it
  let beaconManager = ESTBeaconManager()
  
  let places = ["31175":"GroupWindow","21960":"Zillow Window","43886":"Kitchen Window"]
  
  @IBOutlet weak var lblPlace: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 3. Set the beacon manager's delegate
    self.beaconManager.delegate = self
    self.beaconManager.requestAlwaysAuthorization()
    
    //create the beacon region
    let beaconRegion : CLBeaconRegion = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, identifier: "House")
    
    //    let beaconRegion : CLBeaconRegion = CLBeaconRegion(
    //      proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!,
    //      major: 21960, minor: 29347, identifier: "purple")
    
    
    //Opt in to be notified upon entering and exiting region
    beaconRegion.notifyOnEntry = true
    beaconRegion.notifyOnExit = true
    
    //beacon manager asks permission from user
    beaconManager.startRangingBeaconsInRegion(beaconRegion)
    beaconManager.startMonitoringForRegion(beaconRegion)
    
    // Do any additional setup after loading the view.
  }
  
  func beaconManager(manager: AnyObject, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
    
    let beacon = beacons.first
    print(beacon?.major)
    
    if let major = beacon?.major
    {
      if let place = self.places["\(major)"]
      {
      self.lblPlace.text = place
      }
    }
    if beacons.first?.proximity == .Far
    {
      print("FAR")
      
    }
    if beacons.first?.proximity == CLProximity.Immediate
    {
      print("IMMEDIATE")
      
    }
    if beacons.first?.proximity == .Near
    {
      print("NEAR")
      
    }
    if beacons.first?.proximity == .Unknown
    {
      print("UNKNOWN")
      
    }
  }
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
