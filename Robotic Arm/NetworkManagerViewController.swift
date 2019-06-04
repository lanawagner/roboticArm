//
//  NetworkManagerViewController.swift
//  RoboticArm
//
//  Created by Diana Wagner on 4/1/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

//https://stackoverflow.com/questions/19003063/ios-simple-tcp-connection-example

import UIKit

class NetworkManagerViewController : UIViewController {
    
    var networkManager : NetworkManager!
    @IBOutlet weak var ipAddressField: UITextField!
    @IBOutlet weak var portField: UITextField!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var ConnectToArm: UIButton!
    @IBOutlet weak var statusLabl: UILabel!
    
    override func viewDidLoad() {
        setupUI()
        let nv = self.navigationController as! LanaNavigationController
        networkManager = nv.networkManager
        //socketConnector = SocketDataManager(with: self)
   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
        self.view.backgroundColor = LayoutSettings.blue
    }
    
    @IBAction func connectButtonPressed(_ sender: Any) {
        //http://localhost:50694/
        guard let ipAddr = ipAddressField.text, let portVal = portField.text  else {
            return
        }
        let soc = DataSocket(ip: ipAddr, port: portVal)
        networkManager.connectWith(socket: soc)

    }
    
    @IBAction func send(){
        guard let msg = messageField.text else {
            return
        }
        send(message: msg)
        messageField.text = ""
    }
    
    func send(message: String){ //only used with send button
        
        networkManager.send(message: message)
       
    }
    

    
}

