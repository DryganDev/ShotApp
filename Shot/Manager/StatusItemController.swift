//
//  StatusItemController.swift
//  Shot
//
//  Created by Artsiom Sazonau on 5/3/20.
//  Copyright © 2020 Drygan Dev. All rights reserved.
//

import AppKit

final class StatusItemController: NSObject {
        
    @IBOutlet var menu: NSMenu!
    @IBOutlet var firstMenuItem: NSMenuItem!
    
    let systemStatusBar = NSStatusBar.system
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    
    
    
}

extension StatusItemController: NSMenuDelegate {
    
    func menuNeedsUpdate(_ menu: NSMenu) {
        
    }
    
    func menu(_ menu: NSMenu, update item: NSMenuItem, at index: Int, shouldCancel: Bool) -> Bool {
        return true
    }
    
    func menuWillOpen(_ menu: NSMenu) {
        
    }
    
    func menu(_ menu: NSMenu, willHighlight item: NSMenuItem?) {
        
    }
    
}

