//
//  ListingsViewController.swift
//  ZipcodeHackathon
//
//  Created by Lucas Farah on 11/7/15.
//  Copyright © 2015 Lucas Farah. All rights reserved.
//

import UIKit

class ListingsViewController: UIViewController {


  @IBOutlet weak var table: UITableView!
  let arr = ["1043 Mangrove Ln","175 Phelan Ave","1285 19th St"]
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func getStuffFromServer()
  {
    
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
    // setup cell without force unwrapping it
    cell.lblAddressListing.text = arr[indexPath.row]
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
  {
    
  }
}
