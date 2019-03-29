//
//  LanaTextBox.swift
//  RoboticArm
//
//  Created by Diana Wagner on 3/28/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit


class LanaTextBox : UITextField {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        UISetup()
    }
    func UISetup(){
      
        self.backgroundColor = UIColor(red: 250, green: 0, blue: 0, alpha: 50)
    }
    
}
