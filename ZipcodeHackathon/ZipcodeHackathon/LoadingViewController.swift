//
//  LoadingViewController.swift
//  ZipcodeHackathon
//
//  Created by Lucas Farah on 11/7/15.
//  Copyright © 2015 Lucas Farah. All rights reserved.
//

import UIKit
import Alamofire
class LoadingViewController: UIViewController {

  @IBOutlet weak var lblLoading: UILabel!
  
  var maxExtraversion = 0.0
  var maxNeuroticizm = 0.0
  var maxOpenness = 0.0
  var maxConscientiousness = 0.0
  var maxAgreeableness = 0.0
  
  
  override func prefersStatusBarHidden() -> Bool {
    return navigationController?.navigationBarHidden == true
  }
  override func viewWillAppear(animated: Bool) {
    navigationController?.setNavigationBarHidden(navigationController?.navigationBarHidden == false, animated: true) //or animated: false

  }
  
  override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
    return UIStatusBarAnimation.Fade
  }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      
      NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "fade", userInfo: nil, repeats: true)
 
self.getStuffFromServer()
  }
  
  func getStuffFromServer()
  {
    Alamofire.request(.GET, "https://radiant-springs-1893.herokuapp.com/personality/troy")
      .responseJSON { response in
        //        print(response.data)     // server data
        //        print(response.result)   // result of response serialization
        do
        {
          let json = try NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
         
          self.maxExtraversion = json["Extraversion"] as! Double
          self.maxNeuroticizm = json["Neuroticism"] as! Double
          self.maxOpenness = json["Openness"] as! Double
          self.maxConscientiousness = json["Conscientiousness"] as! Double
          self.maxAgreeableness = json["Agreeableness"] as! Double
          
          NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "change", userInfo: nil, repeats: true)
          NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "move", userInfo: nil, repeats: false)


        }
        catch{}
        
    }
  }
  
  func move()
  {
    self.performSegueWithIdentifier("top5", sender: nil)
  }
  
  
  func fade()
  {
    UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
      self.lblLoading.alpha = 0.0
      }, completion: {
        (finished: Bool) -> Void in
        
        // Fade in
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
          self.lblLoading.alpha = 1.0
          }, completion: nil)
    })
  }
  @IBOutlet weak var barOpenness: UISlider!
  @IBOutlet weak var barConscientiousness: UISlider!
  @IBOutlet weak var barExtraversion: UISlider!
  @IBOutlet weak var barAgreebleness: UISlider!
  @IBOutlet weak var barNeuroticism: UISlider!
  
  
  @IBOutlet weak var lblOpenness: UILabel!
  @IBOutlet weak var lblConscientiousness: UILabel!
  
  @IBOutlet weak var lblExtraversion: UILabel!
  @IBOutlet weak var lblAgreebleness: UILabel!
  
  @IBOutlet weak var lblNeuroticism: UILabel!
  
  
  var value = 0.0

  func change()
  {
    
    self.setbarAgreeblenessValue(self.value)
    self.setbarConscientiousnessValue(self.value)
    self.setbarExtraversionValue(self.value)
    self.setbarNeuroticismValue(self.value)
    self.setBarOpennessValue(self.value)
    
    self.value += 0.5
  }
  func setBarOpennessValue(value: Double)
  {
    let finalValue = self.maxOpenness * 100
    if value <= Double(finalValue)
    {
      self.barOpenness.value = Float(value)
      self.lblOpenness.text = "\(Int(value))%"
    }
  }
  func setbarConscientiousnessValue(value: Double)
  {
    let finalValue = self.maxConscientiousness * 100
    if value <= Double(finalValue)
    {
      self.barConscientiousness.value = Float(value)
      self.lblConscientiousness.text = "\(Int(value))%"
      
    }
  }
  func setbarExtraversionValue(value: Double)
  {
    let finalValue = self.maxExtraversion * 100
    if value <= Double(finalValue)
    {
      self.barExtraversion.value = Float(value)
      self.lblExtraversion.text = "\(Int(value))%"
      
    }
  }
  func setbarNeuroticismValue(value: Double)
  {
    let finalValue = self.maxNeuroticizm * 100
    if value <= Double(finalValue)
    {
      self.barNeuroticism.value = Float(value)
      self.lblNeuroticism.text = "\(Int(value))%"
      
    }
  }
  func setbarAgreeblenessValue(value: Double)
  {
    let finalValue = maxAgreeableness * 100
    if value <= Double(finalValue)
    {
      self.barAgreebleness.value = Float(value)
      self.lblAgreebleness.text = "\(Int(value))%"
      
    }
  }
  /*
  [UIView animateWithDuration:2 animations:^{
  [self.slider setValue:.75];
  } completion:^(BOOL finished) {
  [UIView animateWithDuration:2 animations:^{
  [self.slider setValue:0.25];//or `[self.slider setValue:(.75)-(.5*finished)];` if you want to be safe
  }];
  }];
  */

}
