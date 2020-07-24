import SwiftUI

struct TextImage: View {
    @EnvironmentObject var viewModel: ViewModel
//    @ObservedObject var image: NSImage
    
    var body: some View {
        VStack {
            if viewModel.image != nil {
                Image(nsImage: viewModel.image!)
                    .resizable()
//                    .withoutScratch(image)
            }
            Button(action: {
                print("Pressed")
                self.viewModel.makeScreenshot()
            }, label: {
                Text("hi")
            })
        }
    }
    
}

//struct TextImage_Previews: PreviewProvider {
//    struct BindingTestHolder: View {
//        @State var viewModel = ViewModel(networkManager: nil)
//        @State var testItem = NSImage(imageLiteralResourceName: "screenshot")
////            = ViewModel(networkManager: nil)
////            = NSImage(imageLiteralResourceName: "screenshot")
//        var body: some View {
//            TextImage(viewModel: viewModel, image: testItem)
////            (viewModel: $testItem, image: $testItem)
//        }
//    }
//    static var previews: some View {
//        BindingTestHolder()
//    }
//}
