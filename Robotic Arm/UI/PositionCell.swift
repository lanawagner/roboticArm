//
//  PositionCell.swift
//  Robotic Arm
//
//  Created by Diana Wagner on 3/4/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class PositionCell : UITableViewCell {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        UISetup()
    }
    
    func UISetup() {
        self.backgroundColor = LayoutSettings.blue
    }
    
    //try different names?? look for mistake!
    @IBOutlet weak var PositionIndex : UILabel!
    @IBOutlet weak var J1 : UILabel!
    @IBOutlet weak var J2 : UILabel!
    @IBOutlet weak var J3 : UILabel!
    @IBOutlet weak var Base : UILabel!
    @IBOutlet weak var Marker: UILabel!
    
    
    var position : Position! {
        didSet {
           
            J1.text = position.bottomJointAngle.description
            J2.text = position.middleJointAngle.description
            J3.text = position.topJointAngle.description
            Base.text = position.baseAngle.description
            
            //the switch doesn't work if it's flipped but we can fix that
            Marker.text = position.markerIsOn.description
            
            
        }
    }
    
    
    
}
