//
//  Position.swift
//  Robotic Arm
//
//  Created by Diana Wagner on 2/25/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class Position : NSObject {
    var baseAngle: Int = 0
    var bottomJointAngle: Int = 0
    var middleJointAngle: Int = 0
    var topJointAngle: Int = 0
    var markerIsOn: Bool = false
    var stringRep: String!
    
    override init() {
        super.init()
    }
    
    convenience init(posBaseAngle : Int , posBottomJointAngle : Int, posMiddleJointAngle: Int, posTopJointAngle: Int, posMarkerIsOn : Bool) {
        
        self.init()
        self.baseAngle = posBaseAngle
        self.bottomJointAngle = posBottomJointAngle
        self.middleJointAngle = posMiddleJointAngle
        self.topJointAngle = posTopJointAngle
        self.markerIsOn = posMarkerIsOn
        self.stringRep = "G," + baseAngle.description + "," + bottomJointAngle.description + "," + middleJointAngle.description + "," + topJointAngle.description + "\n"
    }
    
    
    

    
    
}
