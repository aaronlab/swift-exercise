//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        Text("Hello ").foregroundColor(.green).italic()
            + Text("SwiftUI!\n").foregroundColor(.orange).bold()
            + Text("This is\nAaron Lee.\n").font(.title)
    }
}
// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView())
PlaygroundPage.current.setLiveView(ContentView())
