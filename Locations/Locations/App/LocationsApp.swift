import SwiftUI

@main
struct LocationsApp: App {
  var body: some Scene {
    WindowGroup {
      AgenciesMapView(viewModel: ViewModelsFactories.agenciesMapViewModelFactory)
    }
  }
}
