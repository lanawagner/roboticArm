//
//  ManualViewController.swift
//  Robotic Arm
//
//  Created by Diana Wagner on 2/11/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ManualViewController: UIViewController {
    
    //SETUP UI
    
    var networkManager : NetworkManager!
    func setupUI() {
        //figure out why your custom LayoutSettings don't work
        self.view.backgroundColor = LayoutSettings.blue
        //self.view.backgroundColor = UIColor.red
    }
    
    
    var LoadedRoutine: Routine! {
        didSet {
            
        }
    }
    
    var LoadedPosition: Position! {
        didSet {
       
        }
    }

    @IBOutlet weak var SavePositionButton: UIButton!
    
    @IBAction func SavePositionPressed(_ sender: Any) {
        
        let newPosition: Position = Position(posBaseAngle: Int(BaseSlider!.value), posBottomJointAngle: Int(Joint1Slider!.value), posMiddleJointAngle: Int(Joint2Slider!.value), posTopJointAngle: Int(Joint3Slider!.value), posMarkerIsOn: MarkerSwitch.isOn)
        LoadedRoutine.addPosition(Position: newPosition)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func updateJointLabels() {
        //MAKE THESE INTS NOT FLOATS
        //also align the labels because it looks weird
        Joint1PositionLabel.text = Joint1Slider.value.description
    Joint2PositionLabel.text=Joint2Slider.value.description
    Joint3PositionLabel.text=Joint3Slider.value.description
    BasePositionLabel.text=BaseSlider.value.description
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nv = self.navigationController as! LanaNavigationController
        networkManager = nv.networkManager
        setupUI()
        updateJointLabels()
        SendContinuouslySwitch.isOn = false
        //fix these so they're not floats
        Joint1Slider.minimumValue = 0
        Joint2Slider.minimumValue = 0
        Joint3Slider.minimumValue = 0
        BaseSlider.minimumValue = 0
        Joint1Slider.maximumValue = 180
        Joint2Slider.maximumValue = 180
        Joint3Slider.maximumValue = 180
        BaseSlider.maximumValue = 180
        if LoadedPosition != nil {
            Joint1Slider.value = Float( LoadedPosition.bottomJointAngle)
            Joint2Slider.value = Float( LoadedPosition.middleJointAngle)
            Joint3Slider.value = Float( LoadedPosition.topJointAngle)
            BaseSlider.value = Float( LoadedPosition.baseAngle)
            updateJointLabels()
            SavePositionButton.isHidden = false
        }
        else {
            SavePositionButton.isHidden = true
        }
    }

    //i think in here all the stuff is fixed to your label like see #1
    @IBOutlet weak var Joint1PositionLabel: LanaLabel!
    @IBOutlet weak var Joint2PositionLabel: LanaLabel!
    @IBOutlet weak var Joint3PositionLabel: LanaLabel!
    @IBOutlet weak var BasePositionLabel: LanaLabel!
    @IBOutlet weak var Joint1Slider: UISlider!
    @IBOutlet weak var Joint2Slider: UISlider!
    @IBOutlet weak var Joint3Slider: UISlider!
    @IBOutlet weak var BaseSlider: UISlider!
    @IBOutlet weak var MarkerSwitch: UISwitch!
    
    
    @IBOutlet weak var SendContinuouslySwitch: UISwitch!
    
    @IBOutlet weak var Led1Switch: UISwitch!
    @IBOutlet weak var Led2Switch: UISwitch!
    @IBOutlet weak var Led3Switch: UISwitch!
    @IBOutlet weak var Led4Switch: UISwitch!
    
    @IBOutlet weak var SendPositionButton: UIButton!
    @IBOutlet weak var ResetButton: UIButton!
    
    
    @IBAction func Joint1SliderMove(_ sender: Any) {
        updateJointLabels()
    }
    @IBAction func Joint2SliderMove(_ sender: Any) {
        updateJointLabels()
    }
    @IBAction func Joint3SliderMove(_ sender: Any) {
        updateJointLabels()
    }
    @IBAction func BaseSliderMove(_ sender: Any) {
        updateJointLabels()
    }
    @IBAction func MarkerSwitched(_ sender: Any) {
    }
    
    
    @IBAction func Led1Changed(_ sender: Any) {
    }
    @IBAction func Led2Changed(_ sender: Any) {
    }
    @IBAction func Led3Changed(_ sender: Any) {
    }
    @IBAction func Led4Changed(_ sender: Any) {
    }
    
    var sendContinuouslyTimer : Timer!
    
    @IBAction func sendCChanged(_ sender: Any) {
        if SendContinuouslySwitch.isOn{
   //         SendPositionButton.isEnabled=false
            SendPositionButton.setTitle("ABORT", for: .normal)
            //put code to initiate timed sending stuff
            sendContinuouslyTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(SendPositionPressed(_:)), userInfo: nil, repeats: true)
        }
        else {
          //  SendPositionButton.isEnabled=true
            //sendContinuouslyTimer.invalidate()
            SendPositionButton.setTitle("Send Position", for: .normal)
        }
    }
    
//    @objc func sendStuffContinuously() {
//        let aPosition : Position = Position(posBaseAngle: Int(BaseSlider!.value), posBottomJointAngle: Int(Joint1Slider!.value), posMiddleJointAngle: Int(Joint2Slider!.value), posTopJointAngle: Int(Joint3Slider!.value), posMarkerIsOn: MarkerSwitch.isOn)
//        networkManager.sendPosition(pos: aPosition)
//    }
    
    @IBAction @objc func SendPositionPressed(_ sender: Any) {
      //FIGURE THIS OUT
        //SPLIT INTO 2 FUNC, 1 OBJC one nOT??!! do it u won't
        
        if (!SendContinuouslySwitch.isOn) {
            let aPosition : Position = Position(posBaseAngle: Int(BaseSlider!.value), posBottomJointAngle: Int(Joint1Slider!.value), posMiddleJointAngle: Int(Joint2Slider!.value), posTopJointAngle: Int(Joint3Slider!.value), posMarkerIsOn: MarkerSwitch.isOn)
            networkManager.sendPosition(pos: aPosition)
        }
        else{
        sendContinuouslyTimer.invalidate()
            SendPositionButton.setTitle("Send Position", for: .normal)
        }

    }
    @IBAction func ResetPressed(_ sender: Any) {
        //to send reset command
    }
    
    
}

