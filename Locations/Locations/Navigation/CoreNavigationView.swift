import SwiftUI

struct CoreNavigationView: View {

  // MARK: - Properties

  // MARK: Internal

  var body: some View {
    AgenciesMapView(
      viewModel: ViewModelsFactories.agenciesMapViewModelFactory,
      onPinTap: showAgencyDetailsSheet
    )
    .sheet(isPresented: $isShowingAgencyDetails) {
      if let selectedAgency {
        AgencyDetailView(viewModel: AgencyDetailViewModel(agency: selectedAgency))
          .presentationDetents([.medium])
          .presentationDragIndicator(.visible)
      }
    }
  }

  // MARK: Private

  @State private var isShowingAgencyDetails: Bool = false
  @State private var selectedAgency: Agency? = nil

  // MARK: - Methods

  // MARK: Private

  private func showAgencyDetailsSheet(for agency: Agency) {
    selectedAgency = agency
    isShowingAgencyDetails = true
  }
}

#Preview {
  CoreNavigationView()
}
