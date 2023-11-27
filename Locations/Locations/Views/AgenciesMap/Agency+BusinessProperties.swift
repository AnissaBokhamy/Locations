import CoreLocation
import SwiftUI

extension Agency {

  var pinColor: Color {
    switch countryCode {
    case .canada:
      return Colors.Accent.red
    case .unitedStates:
      return Colors.Accent.pink
    case .france:
      return Colors.Accent.darkBlue
    case .unitedKingdom:
      return Colors.Accent.green
    case .germany:
      return Colors.Accent.yellow
    default:
      return Colors.Accent.lightBlue
    }
  }

  // TODO: Change to center location
  var centerLocation: CLLocationCoordinate2D? {
    return coordinates.maxBounds
  }
}
