//
//  RoutineListControllerTest.swift
//  Robotic Arm
//
//  Created by Diana Wagner on 2/18/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class RoutineListControllerTest : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    @IBOutlet weak var tableView : UITableView!
    
    
     override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}
