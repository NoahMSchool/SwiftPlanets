import SwiftUI

@main
struct MyApp: App {
    @StateObject var galaxy = GameController()

    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(galaxy)
            //TestView()
            //SettingsView()
            
            //ContentView().environmentObject(galaxy)

        }
    }
}
