//
//  AppDelegate.swift
//  Shot
//
//  Created by Artsiom Sazonau on 12/18/19.
//  Copyright © 2019 Drygan Dev. All rights reserved.
//

import Cocoa
import SwiftUI
import HotKey
import Combine

let keyCombo = KeyCombo(key: .four, modifiers: [.command, .shift])

let networkManager = NetworkManager()
let routerStatusBar = RouterStatusBar()
let routerWindows = RouterWindows() 

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
   
    @IBOutlet var statusItemController: StatusItemController!
    
    lazy var statusItem = statusItemController.statusItem

    var currentViewModel = ViewModel(networkManager: networkManager)
    
    var menuCancelable: Cancellable?
    
    let hotKey = HotKey(keyCombo: keyCombo)
        
    func applicationDidFinishLaunching(_ aNotification: Notification) {

        // Create the SwiftUI view and set the context as the value for the managedObjectContext environment keyPath.
        // Add `@Environment(\.managedObjectContext)` in the views that will need the context.
        let contentView = StatusImageView(viewModel: currentViewModel).environment(\.managedObjectContext, persistentContainer.viewContext)
        // Create the window and set the content view.
        let hostingView = NSHostingView(rootView: contentView)
//        routerWindows.showWindow(hostingView)
//        window = NSWindow(
//            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
//            styleMask: [.titled, .closable, .miniaturizable, .resizable],
//            backing: .buffered, defer: false)
//        window.center()
//        window.setFrameAutosaveName("Main Window")
//        window.contentView = NSHostingView(rootView: contentView)
//        window.makeKeyAndOrderFront(nil)
//        NSEvent
        
//        UIKeyCommand
//        NSEvent.addGlobalMonitorForEvents(matching: [.flagsChanged]) { (event) in
//            print("global")
//            print(event)
//        }
//        NSEvent.addLocalMonitorForEvents(matching: [.systemDefined]) { (event) -> NSEvent? in
//            print("local")
//            print(event)
//            return event
//        }
        hotKey.keyDownHandler = { [unowned self] in
            self.currentViewModel.makeScreenshot()
            routerWindows.showWindow(hostingView)
        }
        
        if let button = statusItem.button {
            statusItem.menu = statusItemController.menu
            let view = NSHostingView(rootView: contentView)
            view.frame = NSRect(origin: .zero, size: CGSize(width: 200, height: 200))
            statusItemController.firstMenuItem.view = view
            button.image = NSImage(named:NSImage.Name("screenshot"))
            menuCancelable = currentViewModel.$image
                .print()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { (some) in
                    print(some)
                }, receiveValue: { [unowned self] image in
                    guard let size = image?.size else { return }
                    view.frame = NSRect(origin: CGPoint(x: 100, y: 0), size: CGSize(width: 400, height: 400))
                    view.needsDisplay = true
                })
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentCloudKitContainer(name: "Shot")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving and Undo support

    @IBAction func saveAction(_ sender: AnyObject?) {
        // Performs the save action for the application, which is to send the save: message to the application's managed object context. Any encountered errors are presented to the user.
        let context = persistentContainer.viewContext

        if !context.commitEditing() {
            NSLog("\(NSStringFromClass(type(of: self))) unable to commit editing before saving")
        }
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Customize this code block to include application-specific recovery steps.
                let nserror = error as NSError
                NSApplication.shared.presentError(nserror)
            }
        }
    }

    func windowWillReturnUndoManager(window: NSWindow) -> UndoManager? {
        // Returns the NSUndoManager for the application. In this case, the manager returned is that of the managed object context for the application.
        return persistentContainer.viewContext.undoManager
    }

    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
        // Save changes in the application's managed object context before the application terminates.
        let context = persistentContainer.viewContext
        
        if !context.commitEditing() {
            NSLog("\(NSStringFromClass(type(of: self))) unable to commit editing to terminate")
            return .terminateCancel
        }
        
        if !context.hasChanges {
            return .terminateNow
        }
        
        do {
            try context.save()
        } catch {
            let nserror = error as NSError

            // Customize this code block to include application-specific recovery steps.
            let result = sender.presentError(nserror)
            if (result) {
                return .terminateCancel
            }
            
            let question = NSLocalizedString("Could not save changes while quitting. Quit anyway?", comment: "Quit without saves error question message")
            let info = NSLocalizedString("Quitting now will lose any changes you have made since the last successful save", comment: "Quit without saves error question info");
            let quitButton = NSLocalizedString("Quit anyway", comment: "Quit anyway button title")
            let cancelButton = NSLocalizedString("Cancel", comment: "Cancel button title")
            let alert = NSAlert()
            alert.messageText = question
            alert.informativeText = info
            alert.addButton(withTitle: quitButton)
            alert.addButton(withTitle: cancelButton)
            
            let answer = alert.runModal()
            if answer == .alertSecondButtonReturn {
                return .terminateCancel
            }
        }
        // If we got here, it is time to quit.
        return .terminateNow
    }

}
