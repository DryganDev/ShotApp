//
//  ContentView.swift
//  Shot
//
//  Created by Artsiom Sazonau on 12/18/19.
//  Copyright © 2019 Drygan Dev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    
    
    @State var image: CGImage?
    var body: some View {
        TextImage(image: image)
            .frame(minWidth: 500, idealWidth: 600, maxWidth: 700, minHeight: 500, idealHeight: 600, maxHeight: 700, alignment: .center)
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
