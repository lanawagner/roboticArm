//
//  RoutineListController.swift
//  Robotic Arm
//
//  Created by Diana Wagner on 2/18/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class RoutineListController : UITableViewController {
    
    var routineStore : RoutineStore = RoutineStore()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
    }
    
    func setupUI() {
        self.view.backgroundColor = LayoutSettings.blue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routineStore.numberOfRoutines
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoutineCell") as! RoutineCell
     
   
         cell.routine = routineStore.routines[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "editRoutine":
            let destinationVC = segue.destination as? PositionListController
            
            if let row = tableView.indexPathForSelectedRow?.row {
                let routine = routineStore.routines[row]
                destinationVC?.routine = routine
                destinationVC?.routineStore = routineStore
                destinationVC?.isNewRoutine = false
                
                
            }
            
            break
        case "createRoutine":
            let destinationVC = segue.destination as? PositionListController
            
                let routine = Routine()
                destinationVC?.routine = routine
                destinationVC?.routineStore = routineStore
                destinationVC?.isNewRoutine = true
            
            
        default:
            print("segue not found")
            break
        }
        
    }
    
    
    
}

//HW 3/4/19:
//get to table view chapter
//add buttons to be able to add routines --> add positions --> pulls up manual view controller
//implement the row deletion thing for routines/positions
//also figure out mistake of linking in table view from routines --> positions, rename and relink
