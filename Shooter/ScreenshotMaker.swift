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
    
    
    
    func doScreenshot() throws {
        let task = Process()
        task.launchPath = "/usr/sbin/screencaptur"
        print(Config.shared.imageDestination.path)
        print(Config.shared.imageDestination.absoluteString)
        task.arguments = ["-i", "-r", Config.shared.imageDestination.path]
        task.qualityOfService = .userInteractive
        try task.run()
        task.waitUntilExit()
        
    }
    
}
