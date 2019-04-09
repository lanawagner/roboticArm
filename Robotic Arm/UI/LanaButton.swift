//
//  LanaButton.swift
//  RoboticArm
//
//  Created by Diana Wagner on 4/8/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class LanaButton : UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        UISetup()
    }
    func UISetup(){
        
       self.tintColor = LayoutSettings.red
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)

    }
}
