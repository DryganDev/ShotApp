import Foundation
import CoreGraphics
import AppKit

final class ScreenshotMaker {
    
    let imageDestination: URL = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask)[0]
    
    private var timeStamp: String {
        return timeFormatter.string(from: Date())
    }
    
    lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        return formatter
    }()
    
    func doScreenshot() -> NSImage? {
        let task = Process()
        task.launchPath = "/usr/sbin/screencapture"
        let destination = imageDestination.path + " " + timeStamp + ".jpeg"
        task.arguments = ["-i", destination]
        try! task.run()
        task.waitUntilExit()
//        let url = URL(fileURLWithPath: destination)
        let image = NSImage(contentsOfFile: destination)
        return image
        
//        UIGraphicsBeginImageContext(view.frame.size)
//        view.layer.renderInContext(UIGraphicsGetCurrentContext())
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        //Save it to the camera roll
//        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        
//        let displayID = CGMainDisplayID()
//        let imageRef = CGDisplayCreateImage(displayID)
        
//        let context = CGDisplayGetDrawingContext(displayID)
//        context?.addLines(between: [CGPoint(x: 5, y: 5), CGPoint(x: 100, y: 5), CGPoint(x: 100, y: 100), CGPoint(x: 5, y: 100)])
//        context?.drawPath(using: .fill)
        
//        return imageRef
        
        
//        return nil
    }
    
}
