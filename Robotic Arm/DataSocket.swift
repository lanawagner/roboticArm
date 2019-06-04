//
//  DataSocket.swift
//  
//
//  Created by Diana Wagner on 6/4/19.
//

public struct DataSocket {
    
    let ipAddress: String!
    let port: Int!
    
    init(ip: String, port: String){
        self.ipAddress = ip
        self.port      = Int(port)
    }
}
