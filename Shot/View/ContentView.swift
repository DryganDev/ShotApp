//
//  ContentView.swift
//  Shot
//
//  Created by Artsiom Sazonau on 12/18/19.
//  Copyright © 2019 Drygan Dev. All rights reserved.
//

import SwiftUI

private var rect = NSRect(origin: .zero, size: CGSize(width: 40, height: 40)) {
    didSet {
        print(rect)
    }
}

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    
    @State var image: CGImage? = NSImage(color: NSColor.white, size: NSSize(width: 40, height: 40)).cgImage(forProposedRect: &rect, context: nil, hints: nil)
    var body: some View {
        TextImage(image: image)
            .frame(minWidth: 10, idealWidth: 60, maxWidth: 700, minHeight: 10, idealHeight: 60, maxHeight: 700, alignment: .center)
//        VStack{
//            Image(decorative: image, scale: 1)
//            Button(action: {
//                self.image = ScreenshotMaker().doScreenshot()
//            }, label: {
//                Text("hi")
//            })
//        }
    }
    
//    init(image: CGImage?) {
//        if image != nil {
//            self.image = image!
//        }
//        self.image = image!
//    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(image: ScreenshotMaker().doScreenshot()!)
    }
}
