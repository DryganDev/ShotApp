//
//  WindowController.swift
//  Shot
//
//  Created by Artsiom Sazonau on 7/14/20.
//  Copyright © 2020 Drygan Dev. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    override func windowWillLoad() {
        super.windowWillLoad()
        
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
//        NotificationCenter.default.addObserver(forName: NSWindow.willCloseNotification, object: nil, queue: .main) { notif in
//            print(notif)
//        }
        
    }
    
    override func windowTitle(forDocumentDisplayName displayName: String) -> String {
        "Some"
    }
    
    override func close() {
        super.close()
        
    }
    
}

extension WindowController: NSWindowDelegate {
    
    func windowShouldClose(_ sender: NSWindow) -> Bool {
        return true
    }
    
    func windowWillClose(_ notification: Notification) {
        print(notification)
    }
    
}
