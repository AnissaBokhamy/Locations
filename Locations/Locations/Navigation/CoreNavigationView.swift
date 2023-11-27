import SwiftUI

struct CoreNavigationView: View {

  // MARK: - Properties

  // MARK: Internal

  var body: some View {
    AgenciesMapView(
      viewModel: ViewModelsFactories.agenciesMapViewModelFactory,
      onPinTap: showAgencyDetailsSheet
    )
    .sheet(item: $selectedAgency) { selectedAgency in
      AgencyDetailView(viewModel: AgencyDetailViewModel(agency: selectedAgency))
        .presentationDetents([.medium])
        .presentationDragIndicator(.visible)
        .presentationBackgroundInteraction(.enabled)
    }
  }

  // MARK: Private

  @State private var selectedAgency: Agency? = nil

  // MARK: - Methods

  // MARK: Private

  private func showAgencyDetailsSheet(for agency: Agency) {
    selectedAgency = agency
  }
}

#Preview {
  CoreNavigationView()
}
