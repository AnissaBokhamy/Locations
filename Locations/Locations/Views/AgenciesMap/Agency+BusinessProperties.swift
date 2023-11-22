import CoreLocation
import SwiftUI

extension Agency {

  var pinColor: Color {
    switch countryCode {
    case .canada:
      return Colors.red
    case .unitedStates:
      return Colors.pink
    case .france:
      return Colors.darkBlue
    case .unitedKingdom:
      return Colors.green
    case .germany:
      return Colors.yellow
    default:
      return Colors.lightBlue
    }
  }

  // TODO: Change to center location
  var centerLocation: CLLocationCoordinate2D? {
    return coordinates.maxBounds
  }
}
