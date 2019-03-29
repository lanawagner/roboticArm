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
func UISetup(){
    
    self.backgroundColor = LayoutSettings.lightGrey
    
    }

}

