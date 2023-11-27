import MapKit
import SwiftUI

struct AgenciesMapView: View {

  var body: some View {
    Map {
      ForEach(viewModel.agenciesViewModels, id: \.agency.name) { agencyViewModel in
        if let agencyCenterLocation = agencyViewModel.centerLocation {
          Annotation(agencyViewModel.agency.name, coordinate: agencyCenterLocation) {
            Button(action: { onPinTap(agencyViewModel.agency) }) {
              Image(Icons.pin)
                .renderingMode(.template)
                .foregroundStyle(agencyViewModel.pinColor)
            }
          }
        }
      }
    }
    .task {
      await viewModel.loadAgencies()
    }
  }

  @StateObject var viewModel: AgenciesMapViewModel
  let onPinTap: (Agency) -> Void
}

// MARK: - Preview

#Preview {
  let agencies = [
    Agency(
      name: "STM",
      city: "Montréal",
      countryCode: .canada,
      subCountryCode: "QC",
      stars: Stars.five,
      lastUpdateTimestamp: .now,
      coordinates: Coordinates(
        maxLatitude: 45.7916,
        maxLongitude: -73.3465,
        minLatitude: 45.3081,
        minLongitude: -74.0894
      )
    ),
    Agency(
      name: "MTA",
      city: "NewYork",
      countryCode: .unitedStates,
      subCountryCode: "NY",
      stars: Stars.four,
      lastUpdateTimestamp: .now,
      coordinates: Coordinates(
        maxLatitude: 41.0049,
        maxLongitude: -73.6207,
        minLatitude: 40.4103,
        minLongitude: -74.3867
      )
    ),
  ]

  return AgenciesMapView(
    viewModel: AgenciesMapViewModel(
      loadAgencies: { return nil },
      agencies: agencies,
      agenciesMapTheme: ThemeFactory.themeSelector.selectedTheme.agenciesMapTheme
    ),
    onPinTap: { _ in }
  )
  .environmentObject(ThemeFactory.themeSelector)
}
