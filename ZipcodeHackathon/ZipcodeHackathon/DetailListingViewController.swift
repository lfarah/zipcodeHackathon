//
//  DetailListingViewController.swift
//  ZipcodeHackathon
//
//  Created by Lucas Farah on 11/7/15.
//  Copyright © 2015 Lucas Farah. All rights reserved.
//

import UIKit

class DetailListingViewController: UIViewController {

  @IBOutlet weak var imgvHouse: UIImageView!
  @IBOutlet weak var lblAgentName: UILabel!
  @IBOutlet weak var imgvAgent: UIImageView!
  @IBOutlet weak var lblPrice: UILabel!
  @IBOutlet weak var lblBeds: UILabel!
  @IBOutlet weak var lblBaths: UILabel!
  @IBOutlet weak var lblSqFt: UILabel!
  @IBOutlet weak var lblDescription: UITextView!
  
  
  var dicInfo = NSDictionary()
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      if let address = self.dicInfo["address"] as? String, let image = self.dicInfo["media"]![0]["url"], price = self.dicInfo["price"],let beds = self.dicInfo["bedrooms"], let baths = self.dicInfo["baths"],let detail = self.dicInfo["publicRemarks"]
        
      {
        //Address
//        self.lbla.text = address
        
        //Price
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        // formatter.locale = NSLocale.currentLocale() // This is the default
        if let finalPrice = formatter.stringFromNumber(price as! NSNumber) // "$123.44"
        {
          self.lblPrice.text = "\(finalPrice)"
        }
        //Beds/Baths
        self.lblBeds.text = "\(beds)"
        
        //Baths
        self.lblBaths.text =  "\(baths) Baths"
        
        //Detail
        self.lblDescription.text = detail as! String
        //Image
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0))
          {
            // Task
            let imageData = UIImage(data: NSData(contentsOfURL: NSURL(string: image as! String)!)!)
            dispatch_async(dispatch_get_main_queue())
              {
                //UI
                self.imgvHouse.image = imageData
            }
        }
      }    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
