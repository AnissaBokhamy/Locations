import CoreLocation

struct AgencyMapViewModel {

  let agency: Agency

  var centerLocation: CLLocationCoordinate2D? {
    let coordinates = agency.coordinates
    guard let minLatitude = coordinates.minLatitude,
          let maxLatitude = coordinates.maxLatitude,
          let minLongitude = coordinates.minLongitude,
          let maxLongitude = coordinates.maxLongitude else { return nil }
    let latitudeCentre = Double.center(between: minLatitude, and: maxLatitude)
    let longitudeCentre = Double.center(between: minLongitude, and: maxLongitude)
    return CLLocationCoordinate2D(latitude: latitudeCentre, longitude: longitudeCentre)
  }
}

fileprivate extension Double {

  static func center(between lhs: Double, and rhs: Double) -> Double {
    (lhs + rhs) / 2
  }
}
