//
//  NetworkManager.swift
//  RoboticArm
//
//  Created by Diana Wagner on 4/1/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class NetworkManager {
    
    var IPAddress : String!
    var port : String!
    var wifiName : String!
   
    func sendPosition(pos Position: Position) {
        print(Position.topJointAngle)
    }
}
