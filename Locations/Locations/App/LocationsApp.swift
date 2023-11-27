import SwiftUI

@main
struct LocationsApp: App {
  var body: some Scene {
    WindowGroup {
      CoreNavigationView()
        .environmentObject(ThemeSelector(selectedTheme: DefaultTheme()))
    }
  }
}
