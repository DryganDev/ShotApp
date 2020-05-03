import Foundation
import CoreGraphics

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
    
    func doScreenshot() -> CGImage? {
//        let task = Process()
//        task.launchPath = "/usr/sbin/screencapture"
//        let destination = imageDestination.path + " " + timeStamp
//        task.arguments = ["-i", "-r", destination]
//        try task.run()
//        task.waitUntilExit()
//        let url = URL(fileURLWithPath: destination)
//        return url
        
//        UIGraphicsBeginImageContext(view.frame.size)
//        view.layer.renderInContext(UIGraphicsGetCurrentContext())
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        //Save it to the camera roll
//        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        let displayID = CGMainDisplayID()
        let imageRef = CGDisplayCreateImage(displayID)
        return imageRef
    }
    
}
