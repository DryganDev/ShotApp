import Foundation
import AppKit

final class ViewModel: ObservableObject {
    
    weak var networkManager: NetworkManager?
    
    var screenShotMaker = ScreenshotMaker()
    
    @Published var some: Int = 1
    @Published var image: NSImage?
    
    init(networkManager: NetworkManager?) {
        self.networkManager = networkManager
    }
    
    func makeScreenshot() {
//        guard let cgImage = screenShotMaker.doScreenshot() else { return }
        image = screenShotMaker.doScreenshot()
//        let sourceRead = DispatchSource.makeReadSource(fileDescriptor: 12, queue: DispatchQueue.main)
//        sourceRead.
//            NSImage(cgImage: cgImage, size: CGSize(width: cgImage.width, height: cgImage.height))
    }
    
    func updateScreenshot(_ image: NSImage) {
        
    }
    
}
