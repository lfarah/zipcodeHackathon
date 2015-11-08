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
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func authMagicSauce () {
    
    let paramsBody:Dictionary<String,String> = ["traits":"BIG5_Openess","uid":"1063389267005163"]
    
    let request = NSMutableURLRequest(URL: NSURL(string: "http://api-v2.applymagicsauce.com/like_ids?traits=BIG5_Openess&uid=1063389267005163")!)
    let session = NSURLSession.sharedSession()
    request.HTTPMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("X-Auth-Token", forHTTPHeaderField: "50ohh5tje1t6sk7lfjlcd1d23u")

    do
    {
    request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(paramsBody, options: .PrettyPrinted)
    let task = session.dataTaskWithRequest(request, completionHandler:{data, response, error -> Void in
      
      if error != nil {
        
        print("shit")
        
      } else {
        
        
        var jsonError: NSError?
        //            println(data)
        do
        {
        if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
          // this code is executed if the json is a NSDictionary
          //                println(json)
          
          
          print(json)
          
        } else {
          // otherwise, this code is executed
          print("shit")
        }
        
      }
        catch{}
      
      }
    })
      task.resume()

    }
    catch{
    }
    
    
    
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
    
  }
}
