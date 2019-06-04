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
    var networkManager : NetworkManager!
    var routineTimer : Timer!
    var positionIndex : Int = 0
    var isSending : Bool = false
    
    override func viewDidLoad() {
        routineName.text = currentRoutine.name
        let nv = self.navigationController as! LanaNavigationController
        networkManager = nv.networkManager
        progressLabel.text = "0%"
        
        startButton.setTitle("RUN", for: .normal)
    }
    
    @IBOutlet var routineName: LanaLabel!
    @IBOutlet var startButton: LanaButton!
    @IBOutlet var progressLabel: LanaLabel!
    
    
    @IBAction func startDataTransfer(sender: Any) {
        //networkManager.processRoutine(r: currentRoutine)
        if (!isSending) {
        startButton.setTitle("ABORT", for: .normal)
        isSending = true
        routineTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(sendPosition), userInfo: nil, repeats: true)
        }
        else{
            routineTimer.invalidate()
            startButton.setTitle("RUN", for: .normal)
            isSending = false
            positionIndex = 0
            progressLabel.text = "0%"
        }

    }
    
    @objc func sendPosition() {
        networkManager.sendPosition(pos: currentRoutine.positions[positionIndex])
        positionIndex = positionIndex + 1
        progressLabel.text = (Float(positionIndex)/Float(currentRoutine.numberOfPos)*100).description+"%"
        
        if (positionIndex==currentRoutine.numberOfPos){
            positionIndex = 0
            routineTimer.invalidate()
            startButton.setTitle("RUN", for: .normal)
            progressLabel.text = "0%"
        }
    }

}
