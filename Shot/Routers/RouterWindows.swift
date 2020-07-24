import AppKit

final class RouterWindows {
    
//    var windowController: WindowController?
//    var viewController: ViewController!
    let windowController = StoryboardScene.Main.windowController.instantiate()
    
    func showWindow(_ view: NSView) {
        if let previosWindow = NSApp.orderedWindows.first {
            NSApp.activate(ignoringOtherApps: true)
            windowController.window!.makeKeyAndOrderFront(NSApp.delegate)
            windowController.window!.makeKey()
        } else {
//            let window = NSWindow(
//                contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
//                styleMask: [.titled, .closable, .miniaturizable, .resizable, .texturedBackground],
//                backing: .buffered, defer: false)
            
            let window = windowController.window!
//            windowController = WindowController(window: window)
            
            let viewController = ViewController()
            viewController.view = view

            window.contentViewController = viewController
            
            window.setFrameAutosaveName("Main Window")
            window.title = "Shot"
//            window.contentView = view
            NSApp.activate(ignoringOtherApps: true)
            window.makeKeyAndOrderFront(NSApp.delegate)
            window.makeKey()
            window.isReleasedWhenClosed = true
        }
    }
    
}
