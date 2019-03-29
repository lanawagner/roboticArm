//
//  RoutineCell.swift
//  Robotic Arm
//
//  Created by Diana Wagner on 2/25/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class RoutineCell : UITableViewCell {
    @IBOutlet weak var routineName : UILabel!
    @IBOutlet weak var numberOfPositions : UILabel!
   
    
    var routine : Routine! {
        didSet {
            numberOfPositions.text = routine.numberOfPos.description
            routineName.text = routine.name
        }
    }
    
    //create a variable of type Routine, then use the didSet parametrs to fill the fields as the variable is set
    //it's in book for fahrenheit/celcius conversion, it automatically converted to celsius, update labels accordingly??
}
