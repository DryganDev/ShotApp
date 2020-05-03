import SwiftUI

struct TextImage: View {
    @State var image: CGImage?
    
    var body: some View {
        VStack {
            if image != nil {
                Image(decorative: image!, scale: 1)
                    .resizable()
                    .withoutScratch(image!)
            }
            Button(action: {
                print("Pressed")
            }, label: {
                Text("hi")
            })
        }
    }
    
}

struct TextImage_Previews: PreviewProvider {
    static var rect = NSRect(x: 0, y: 0, width: 50, height: 50)
    static var previews: some View {
        TextImage(image: NSImage(imageLiteralResourceName: "screenshot").cgImage(forProposedRect: &rect, context: nil, hints: nil))
    }
}
