//
//  PositionListController.swift
//  Robotic Arm
//
//  Created by Diana Wagner on 3/4/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class PositionListController : UITableViewController {
    
    var routine : Routine!  {
        didSet {
            routineCopy = routine.copy() as? Routine
        }
    }
    
    var routineStore : RoutineStore!
    
    var isNewRoutine: Bool = false
    
    var routineCopy : Routine!
    
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
        return routineCopy.numberOfPos
    }
    
    @IBOutlet weak var editPositionList: UIButton!
    
    
    @IBAction func editPositionMode(_ sender: Any) {
        if isEditing {
            editPositionList.setTitle("Edit Position List", for: .normal)
            
            setEditing(false, animated: true)
        } else {
            // EVENTUALLY SWITCH THIS TO SAVE AND HAVE IT SAVE IT FOR REAL
            editPositionList.setTitle("Done", for: .normal)
            
            // Enter editing mode
            setEditing(true, animated: true)
        }
    }
    
    @IBOutlet weak var savePositionList: UIButton!
    @IBAction func savePositionList(_ sender: Any) {
        
        if isNewRoutine {
       
            
            
            //this is probably wrong but i tried ok
            let title = "Add name?"
            let message = "Add a name before you save this new routine."
        
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .alert)
            ac.addTextField(configurationHandler: { (textField) in
                textField.placeholder = "Enter a routine name"
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            let saveAction = UIAlertAction(title: "Save", style: .default, handler: {
                (action) -> Void in
                
                self.routineCopy.name = ac.textFields?[0].text
                self.routineStore.addRoutine(Routine: self.routineCopy)
                self.navigationController?.popViewController(animated: true)
            })
            ac.addAction(saveAction)
            present(ac, animated: true, completion: nil)
            
        }
        else {
            routine = routineCopy
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    
    //DELETE AND MOVE FUNCTIONS
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let position = routineCopy.positions[indexPath.row]
            // Remove the item from the store
            routineCopy.removePosition(Position: position)
            
            // Also remove that row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PositionCell") as! PositionCell
        
        
        cell.position = routineCopy.positions[indexPath.row]
        cell.PositionIndex.text = (indexPath.row + 1).description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
        // Update the model
        routineCopy.movePosition(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    
    //CREATING A NEW POSITION SEGUES
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "createPosition":
            let destinationVC = segue.destination as? ManualViewController
            
            let position = Position()
            destinationVC?.LoadedPosition = position
            destinationVC?.LoadedRoutine = routineCopy
            
         
            //this below is probably wrong
        case "editPosition":
            let destinationVC = segue.destination as? ManualViewController
            
            let position = Position()
            destinationVC?.LoadedPosition = position
            
            if let row = tableView.indexPathForSelectedRow?.row {
                let position = routine.positions[row]
                destinationVC?.LoadedPosition = position
                
                
            }
            
            
        default:
            print("segue not found")
            break
        }
    }
    
    
}
