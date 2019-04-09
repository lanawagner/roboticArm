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
    
    func processRoutine(r Routine: Routine) {
        //MAKE SURE THIS IS TRIGGERED IN RRC
        
        //var for how often to send
        //when button is pressed to send, run (for/while?), dump each position one at a time by sending to network manager, nM prints it, HAVE ACCESS TO NETWORK MANAGER LIKE IN OTHER CONTROLLER yeet
        //networkManager.processRoutine (or something like that) (inside the timer)
        //ALL THE HW IS IN THIS CLASS
    }
}
