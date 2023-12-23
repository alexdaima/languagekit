import SwiftUI

@main
struct app: App {
    init() {
    }
    
    var body: some Scene {
        let globalState = GlobalState()

        WindowGroup {
            ContentView()
                .environmentObject(globalState)
        }
    }
}
