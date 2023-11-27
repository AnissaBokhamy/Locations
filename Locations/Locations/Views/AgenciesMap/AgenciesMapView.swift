import MapKit
import SwiftUI

struct AgenciesMapView: View {

  // MARK: Internal

  var body: some View {
    Map {
      ForEach(viewModel.agenciesViewModels, id: \.agency.name) { agencyViewModel in
        if let agencyCenterLocation = agencyViewModel.centerLocation {
          Annotation(agencyViewModel.agency.name, coordinate: agencyCenterLocation) {
            Button(action: { onPinTap(agencyViewModel.agency) }) {
              Image(Icons.pin)
                .renderingMode(.template)
                .foregroundStyle(pinColor(for: agencyViewModel.agency.countryCode))
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

  // MARK: Private

  @EnvironmentObject private var themeSelector: ThemeSelector
  fileprivate var agenciesMapTheme: AgenciesMapTheme {
    themeSelector.selectedTheme.agenciesMapTheme
  }
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
      agencies: agencies
    ),
    onPinTap: { _ in }
  )
  .environmentObject(ThemeSelector(selectedTheme: DefaultTheme()))
}

// MARK: - AgenciesMapView+PinColor
extension AgenciesMapView {

  func pinColor(for countryCode: Locale.Region) -> Color {
    switch countryCode {
    case .canada:
      return agenciesMapTheme.canadaPinColor
    case .unitedStates:
      return agenciesMapTheme.unitedStatesPinColor
    case .france:
      return agenciesMapTheme.francePinColor
    case .unitedKingdom:
      return agenciesMapTheme.unitedKingdomPinColor
    case .germany:
      return agenciesMapTheme.germanyPinColor
    default:
      return agenciesMapTheme.defaultPinColor
    }
  }
}
