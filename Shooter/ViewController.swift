//
//  ViewController.swift
//  Shooter
//
//  Created by Drygan on 4/12/19.
//  Copyright © 2019 drygan.dev. All rights reserved.
//

import Cocoa
import Alamofire

final class ViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    private let screenshotMaker = ScreenshotMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func buttonTapped(_ sender: NSButton) {
        print(type(of: sender))
        do {
            let destinationImage = try screenshotMaker.doScreenshot()
            if (FileManager.default.fileExists(atPath: destinationImage.path)) {
                let img: NSImage = NSImage(byReferencingFile: destinationImage.path)!
                imageView.image = img
                guard let bits = img.representations.first as? NSBitmapImageRep else { return }
                guard let imageData = bits.representation(using: NSBitmapImageRep.FileType.jpeg, properties: [NSBitmapImageRep.PropertyKey.compressionFactor: 0.9]) else { return }
                Alamofire.upload(multipartFormData: { multipartData in
                    multipartData.append(imageData, withName: "content", fileName: "file", mimeType: "image")
                }, to: "http://localhost:8080/upload",
                   method: HTTPMethod.post,
                   headers: ["Content-Type" : "multipart/form-data"]) { result in
                    switch result {
                    case .success(let upload, _, _):
                        print(upload)
                        upload.responseJSON { response in
                            debugPrint(response)
                        }
                    case .failure(let encodingError):
                        print(encodingError)
                    }
                }
            }
            #warning("think about clipboard")
        } catch {
            print(error)
        }
    }
}

