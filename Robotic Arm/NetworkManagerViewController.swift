//
//  NetworkManagerViewController.swift
//  RoboticArm
//
//  Created by Diana Wagner on 4/1/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class NetworkManagerViewController : UIViewController {
    
    override func viewDidLoad() {
        setupUI()
    }
    
    func setupUI() {
        self.view.backgroundColor = LayoutSettings.blue
    }
    
    @IBOutlet weak var ConnectToArm: UIButton!
    @IBAction func connectButtonPressed(_ sender: Any) {
    //launch wifi screen
    //https://stackoverflow.com/questions/36303123/ios-how-to-programmatically-connect-to-a-wifi-network-given-the-ssid-and-passw
        
    }
    
}
