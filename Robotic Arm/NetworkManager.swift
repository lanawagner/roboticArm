//
//  NetworkManager.swift
//  RoboticArm
//
//  Created by Diana Wagner on 4/1/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

//https://stackoverflow.com/questions/19003063/ios-simple-tcp-connection-example

import UIKit

class NetworkManager {
    
    var IPAddress : String! //
    var port : String! //2000
    var wifiName : String!
    var sendInterval : Int!
   
    var readStream: Unmanaged<CFReadStream>?
    var writeStream: Unmanaged<CFWriteStream>?
    var inputStream: InputStream?
    var outputStream: OutputStream?
    
    func sendPosition(pos Position: Position) {
        print(Position.topJointAngle)
    }
    
    func processRoutine(Routine r : Routine) {
        //MAKE SURE THIS IS TRIGGERED IN RRC
        
        //var for how often to send
        //when button is pressed to send, run (for/while?), dump each position one at a time by sending to network manager, nM prints it, HAVE ACCESS TO NETWORK MANAGER LIKE IN OTHER CONTROLLER yeet
        //networkManager.processRoutine (or something like that) (inside the timer)
        //ALL THE HW IS IN THIS CLASS
    }
    
    
    func connectWith(socket: DataSocket) {
        
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, (socket.ipAddress! as CFString), UInt32(socket.port), &readStream, &writeStream)
        open()
        
    }
    
    func disconnect(){
        
        close()
    }
    
    func open() {
        print("Opening streams.")
        outputStream = writeStream?.takeRetainedValue()
        inputStream = readStream?.takeRetainedValue()
        outputStream?.delegate = self as? StreamDelegate
        inputStream?.delegate = self as? StreamDelegate
        outputStream?.open()
        inputStream?.open()
    }
    
    func close() {
        print("Closing streams.")
        inputStream?.close()
        outputStream?.close()
        inputStream?.delegate = nil
        outputStream?.delegate = nil
        inputStream = nil
        outputStream = nil
    }
    
    
    //fix
    
    func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
        print("stream event \(eventCode)")
        switch eventCode {
        case .openCompleted:
            print("Stream opened")
        case .hasBytesAvailable:
            if aStream == inputStream {
                var dataBuffer = Array<UInt8>(repeating: 0, count: 1024)
                var len: Int
                while (inputStream?.hasBytesAvailable)! {
                    len = (inputStream?.read(&dataBuffer, maxLength: 1024))!
                    if len > 0 {
                        let output = String(bytes: dataBuffer, encoding: .ascii)
                        if nil != output {
                            print("server said: \(output ?? "")")
                            //messageReceived(message: output!) worry about this later
                        }
                    }
                }
            }
        case .hasSpaceAvailable:
            print("Stream has space available now")
        case .errorOccurred:
            print("\(aStream.streamError?.localizedDescription ?? "")")
        case .endEncountered:
            aStream.close()
        
            print("close stream")
            
        default:
            print("Unknown event")
        }
    }
    
   
    
    func send(message: String){
        
        let response = "msg:\(message)"
        let buff = [UInt8](message.utf8)
        if let _ = response.data(using: .ascii) {
            outputStream?.write(buff, maxLength: buff.count)
        }
        
    }


}


