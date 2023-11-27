import CoreLocation
import SwiftUI

struct AgencyMapViewModel {

  let agency: Agency
  let agenciesMapTheme: AgenciesMapTheme

  // TODO: Change to center location
  var centerLocation: CLLocationCoordinate2D? {
    return agency.coordinates.maxBounds
  }

  var pinColor: Color {
    switch agency.countryCode {
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
