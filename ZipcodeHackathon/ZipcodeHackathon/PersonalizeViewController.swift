//
//  PersonalizeViewController.swift
//  ZipcodeHackathon
//
//  Created by Lucas Farah on 11/7/15.
//  Copyright © 2015 Lucas Farah. All rights reserved.
//

import UIKit

class PersonalizeViewController: UIViewController {

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
  override func viewDidLoad() {
        super.viewDidLoad()
   
    NSTimer.scheduledTimerWithTimeInterval(0.005, target: self, selector: "change", userInfo: nil, repeats: true)
//    self.barOpenness.setValue(50, animated: true)
    self.barConscientiousness.continuous = true
    UIView.animateWithDuration(10, animations: {
//      self.barConscientiousness.setValue(0, animated: true)
    })
    }
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
    let finalValue = 60
    if value <= Double(finalValue)
    {
      self.barOpenness.value = Float(value)
      self.lblOpenness.text = "\(Int(value))%"
    }
  }
  func setbarConscientiousnessValue(value: Double)
  {
    let finalValue = 20
    if value <= Double(finalValue)
    {
      self.barConscientiousness.value = Float(value)
      self.lblConscientiousness.text = "\(Int(value))%"

    }
  }
  func setbarExtraversionValue(value: Double)
  {
    let finalValue = 40
    if value <= Double(finalValue)
    {
      self.barExtraversion.value = Float(value)
      self.lblExtraversion.text = "\(Int(value))%"

    }
  }
  func setbarNeuroticismValue(value: Double)
  {
    let finalValue = 80
    if value <= Double(finalValue)
    {
      self.barNeuroticism.value = Float(value)
      self.lblNeuroticism.text = "\(Int(value))%"

    }
  }
  func setbarAgreeblenessValue(value: Double)
  {
    let finalValue = 50
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
