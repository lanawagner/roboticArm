//
//  Routine.swift
//  Robotic Arm
//
//  Created by Diana Wagner on 2/25/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class Routine : NSCopying {
    
    
    func copy(with zone: NSZone? = nil) -> Any {
        let routineCopy : Routine = Routine()
        routineCopy.positions = self.positions
        routineCopy.numberOfPos = self.numberOfPos
        routineCopy.name = self.name
        return routineCopy
    }
    
    
    
    
    var positions : [Position] = [Position]()
    var numberOfPos : Int = 0
    var name: String!
    
    func addPosition(Position pos : Position) {
        positions.append(pos)
        numberOfPos = numberOfPos+1
    }
    
    func removePosition(Position pos : Position) {
                    if let index = positions.index(of: pos) {
                        positions.remove(at: index)
                        numberOfPos = numberOfPos-1
                    }
    }
    func movePosition(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        // Get reference to object being moved so you can reinsert it
        let movedItem = positions[fromIndex]
        
        // Remove item from array
        positions.remove(at: fromIndex)
        
        // Insert item in array at new location
        positions.insert(movedItem, at: toIndex)
    }
    
    
    
   init() {
    
    name = "Untitled"
//
//    let pos1 = Position(posBaseAngle: 40, posBottomJointAngle: 40, posMiddleJointAngle: 40, posTopJointAngle: 40, posMarkerIsOn: true)
//    let pos2 = Position(posBaseAngle: 40, posBottomJointAngle: 40, posMiddleJointAngle: 40, posTopJointAngle: 40, posMarkerIsOn: true)
//    let pos3 = Position(posBaseAngle: 40, posBottomJointAngle: 40, posMiddleJointAngle: 40, posTopJointAngle: 40, posMarkerIsOn: true)
//    let pos4 = Position(posBaseAngle: 40, posBottomJointAngle: 40, posMiddleJointAngle: 40, posTopJointAngle: 40, posMarkerIsOn: true)
//    self.addPosition(Position: pos1)
//    self.addPosition(Position: pos2)
//    self.addPosition(Position: pos3)
//    self.addPosition(Position: pos4)
    
    
    
    }
    
    

    
    
    
    
}
