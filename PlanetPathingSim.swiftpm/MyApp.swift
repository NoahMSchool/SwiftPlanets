import SwiftUI

@main
struct MyApp: App {
    @StateObject var galaxy = Galaxy()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(galaxy)

        }
    }
}
