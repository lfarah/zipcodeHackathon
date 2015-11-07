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
    let finalValue = 60.0
    if value <= finalValue
    {
      self.barOpenness.value = Float(value)
    }
  }
  func setbarConscientiousnessValue(value: Double)
  {
    let finalValue = 20.0
    if value <= finalValue
    {
      self.barConscientiousness.value = Float(value)
    }
  }
  func setbarExtraversionValue(value: Double)
  {
    let finalValue = 40.0
    if value <= finalValue
    {
      self.barExtraversion.value = Float(value)
    }
  }
  func setbarNeuroticismValue(value: Double)
  {
    let finalValue = 80.0
    if value <= finalValue
    {
      self.barNeuroticism.value = Float(value)
    }
  }
  func setbarAgreeblenessValue(value: Double)
  {
    let finalValue = 50.0
    if value <= finalValue
    {
      self.barAgreebleness.value = Float(value)
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
