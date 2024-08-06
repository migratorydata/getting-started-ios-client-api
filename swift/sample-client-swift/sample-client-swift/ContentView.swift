
import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase

    @StateObject var client = Client()
        
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Swift App Demo!")
                .padding()
                .onChange(of: scenePhase) {
                    if scenePhase == .active {
                        print("Active")
                        client.resume()
                    } else if scenePhase == .inactive {
                        print("Inactive")
                    } else if scenePhase == .background {
                        print("Background")
                        client.pause()
                    }
                }
            Button("Start") {
                client.start()
            }
            Button("Stop") {
                client.stop()
            }
            Button("Publish") {
                client.publish()
            }
            Text("Live Status Notifications!")
            Text("\(client.status)")
            Text("Live Messages!")
            Text("\(client.message)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
