//
//  RoutineStore.swift
//  Robotic Arm
//
//  Created by Diana Wagner on 2/25/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class RoutineStore {
    
    var routines : [Routine] = [Routine]()
    var numberOfRoutines : Int = 0
    
    func addRoutine(Routine r : Routine) {
        routines.append(r)
        numberOfRoutines = numberOfRoutines+1
    }
    
   // func removeRoutine(Routine rot : Routine) {
     //   if let index = routines.index(of: rot) {
      //      routines.remove(at: index)
    //       numberOfRoutines = numberOfRoutines-1
      //  }
  //  }
    
    func moveRoutine(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        // Get reference to object being moved so you can reinsert it
        let movedItem = routines[fromIndex]
        
        // Remove item from array
        routines.remove(at: fromIndex)
        
        // Insert item in array at new location
        routines.insert(movedItem, at: toIndex)
    }
    
    init() {
//
        let r1 = Routine()
        self.addRoutine(Routine: r1)
//        let r2 = Routine()
//        self.addRoutine(Routine: r2)
//        let r3 = Routine()
//        self.addRoutine(Routine: r3)
//        let r4 = Routine()
//        self.addRoutine(Routine: r4)
//        let r5 = Routine()
//        self.addRoutine(Routine: r5)
//        let r6 = Routine()
//        self.addRoutine(Routine: r6)
    }
}
