//
//  LanaLabel.swift
//  RoboticArm
//
//  Created by Diana Wagner on 3/28/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class LanaLabel : UILabel {


required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    UISetup()
}
    
override init (frame:CGRect) {
    super.init(frame:frame)
    self.layer.cornerRadius = 5.0
    self.clipsToBounds = true
    self.UISetup()
}
func UISetup(){
    
    self.backgroundColor = LayoutSettings.blue
    self.textColor = UIColor.white
    self.font = UIFont(name: "HelveticaNeue-Light", size: 16)
    //some sort of border? background? rounded corners?
    //code is ew not good sad :,( labels are not good
    //so make it clip to the text and also when it's pretty then change the background color
    
    }

}

