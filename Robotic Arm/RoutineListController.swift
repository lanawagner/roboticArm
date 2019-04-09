//
//  RoutineListController.swift
//  Robotic Arm
//
//  Created by Diana Wagner on 2/18/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class RoutineListController : UITableViewController {
    
    var networkManager : NetworkManager!
    
    var routineStore : RoutineStore = RoutineStore()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
        let nv = self.navigationController as! LanaNavigationController
        networkManager = nv.networkManager
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
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
            let routine = self.routineStore.routines[indexPath.row]
          
            self.routineStore.removeRoutine(Routine: routine)
            
            // Also remove that row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let run = UITableViewRowAction(style: .normal, title: "Run") { (action, indexPath) in
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "RoutineRunController") as! RoutineRunController
            controller.currentRoutine = self.routineStore.routines[indexPath.row]
            self.navigationController?.pushViewController(controller, animated: true)
            
        
        }
        
        run.backgroundColor = UIColor.green
        
        return [delete, run]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoutineCell") as! RoutineCell
     
   
         cell.routine = routineStore.routines[indexPath.row]
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView,
//                            commit editingStyle: UITableViewCell.EditingStyle,
//                            forRowAt indexPath: IndexPath) {
//        // If the table view is asking to commit a delete command...
//        if editingStyle == .delete {
//            let routine = routineStore.routines[indexPath.row]
//            // Remove the item from the store
//            //routineStore.
//
//            // Also remove that row from the table view with an animation
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//        else if editingStyle == . {
//
//        }
//
//    }
    
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
