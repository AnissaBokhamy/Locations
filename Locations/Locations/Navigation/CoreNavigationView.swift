import SwiftUI

struct CoreNavigationView: View {

  var body: some View {
    AgenciesMapView(viewModel: ViewModelsFactories.agenciesMapViewModelFactory)
  }
}

#Preview {
  CoreNavigationView()
}
