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
//                try FileManager.default.moveItem(at: destinationImage, to: Config.shared.imageDestination.appendingPathComponent("ololo - 123"))
//                Alamofire.upload(
//                    multipartFormData: { multipartFormData in
//                        multipartFormData.append(unicornImageURL, withName: "unicorn")
//                        multipartFormData.append(rainbowImageURL, withName: "rainbow")
//                },
//                    to: "https://httpbin.org/post",
//                    encodingCompletion: { encodingResult in
//                        switch encodingResult {
//                        case .success(let upload, _, _):
//                            upload.responseJSON { response in
//                                debugPrint(response)
//                            }
//                        case .failure(let encodingError):
//                            print(encodingError)
//                        }
//                }
//                )
                
                AF.upload(multipartFormData: { multipartData in
                    multipartData.append(Data(contentsOf: destinationImage), withName: "")
                }, to: "",
                   encodingCompletion: { encodingResult in
                    switch encodingResult {
                    case .success(let upload, _, _):
                        upload.responseJSON { response in
                            debugPrint(response)
                        }
                    case .failure(let encodingError):
                        print(encodingError)
                    }
                })
            }
            #warning("think about clipboard")
        } catch {
            print(error)
        }
    }
}

