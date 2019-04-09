//
//  RoutineRunController.swift
//  RoboticArm
//
//  Created by Diana Wagner on 4/8/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class RoutineRunController : UIViewController {
    var currentRoutine : Routine!
    
    override func viewDidLoad() {
       routineName.text = currentRoutine.name
    }
    
    @IBOutlet var routineName: LanaLabel!
    @IBOutlet var startButton: LanaButton!
    @IBOutlet var progressLabel: LanaLabel!
    
    
    @IBAction func startDataTransfer(sender: Any) {
        //networkManager.processRoutine()
    }

}
