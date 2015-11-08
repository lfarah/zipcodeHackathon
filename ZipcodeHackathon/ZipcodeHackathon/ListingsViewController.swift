//
//  ListingsViewController.swift
//  ZipcodeHackathon
//
//  Created by Lucas Farah on 11/7/15.
//  Copyright © 2015 Lucas Farah. All rights reserved.
//

import UIKit
import Alamofire
class ListingsViewController: UIViewController {
  
  
  @IBOutlet weak var table: UITableView!
  var arr = [NSDictionary]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.getStuffFromServer()
//    self.authMagicSauce()
  }
  
  func getStuffFromServer()
  {
    Alamofire.request(.GET, "https://radiant-springs-1893.herokuapp.com/query?zipcode=85048&price=10000000")
      .responseJSON { response in
        //        print(response.data)     // server data
        //        print(response.result)   // result of response serialization
        do
        {
          let json = try NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions.MutableContainers) as! [NSDictionary]
          print(json[0])
          self.arr = json
          self.table.reloadData()
        }
        catch{}
        
    }
  }
  
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return arr.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
  {
    var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! ListingsTableViewCell!
    if !(cell != nil)
    {
      cell = ListingsTableViewCell(style:.Default, reuseIdentifier: "cell")
    }
    
    let place = arr[indexPath.row]
    print(indexPath.row)
    if let address = place["address"] as? String, let image = place["media"]![0]["url"], price = place["price"],let beds = place["bedrooms"], let baths = place["baths"]

    {
      //Address
      cell.lblAddressListing.text = address
      
      //Price
      var formatter = NSNumberFormatter()
      formatter.numberStyle = .CurrencyStyle
      // formatter.locale = NSLocale.currentLocale() // This is the default
      if let finalPrice = formatter.stringFromNumber(price as! NSNumber) // "$123.44"
      {
        cell.lblPrice.text = "\(finalPrice)"
      }
      //Beds/Baths
      cell.lblBedsBaths.text = "\(beds) Beds / \(baths) Baths"
      
      //Image
      dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0))
        {
          // Task
          let imageData = UIImage(data: NSData(contentsOfURL: NSURL(string: image as! String)!)!)
          dispatch_async(dispatch_get_main_queue())
            {
              //UI
              cell.imgvListing.image = imageData
          }
      }
    }
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
  {
    self.performSegueWithIdentifier("detail", sender: arr[indexPath.row])
  }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let theDestination = (segue.destinationViewController as! DetailListingViewController)
    let dicinfo = sender
    theDestination.dicInfo = dicinfo as! NSDictionary
}

}
