//
//  ScreenShotMaker.swift
//  Shooter
//
//  Created by Drygan on 4/12/19.
//  Copyright © 2019 drygan.dev. All rights reserved.
//

import Foundation
import AppKit
import Carbon

class ScreenshotMaker {
    
    private var timeStamp: String {
        return timeFormatter.string(from: Date())
    }
    
    lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        return formatter
    }()
    
    func doScreenshot() throws -> URL {
//        print(Config.shared.imageDestination)
//        print(Config.shared.imageDestination.path)
        
        let task = Process()
        task.launchPath = "/usr/sbin/screencapture"
        let destination = Config.shared.imageDestination.path + " " + timeStamp
//        appendingPathComponent("Screenshot " + timeStamp).path
//            .path + " " + timeStamp
//        print(destination)
        task.arguments = ["-i", "-r", destination]
//
        try task.run()
        task.waitUntilExit()
        let url = URL(fileURLWithPath: destination)
        return url
    }
    
}
