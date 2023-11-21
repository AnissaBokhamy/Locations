import CoreLocation

struct Coordinates: Equatable, Decodable {

  // MARK: - Lifecycle

  init(
    maxLatitude: Double,
    maxLongitude: Double,
    minLatitude: Double,
    minLongitude: Double
  ) {
    self.maxLatitude = maxLatitude
    self.maxLongitude = maxLongitude
    self.minLatitude = minLatitude
    self.minLongitude = minLongitude
  }

  // MARK: - Properties

  // MARK: Internal

  var minBounds: CLLocationCoordinate2D? {
    guard let minLatitude, let minLongitude else { return nil }
    return CLLocationCoordinate2D(latitude: minLatitude, longitude: minLongitude)
  }

  var maxBounds: CLLocationCoordinate2D? {
    guard let maxLatitude, let maxLongitude else { return nil }
    return CLLocationCoordinate2D(latitude: maxLatitude, longitude: maxLongitude)
  }

  let maxLatitude: Double?
  let maxLongitude: Double?
  let minLatitude: Double?
  let minLongitude: Double?

  enum CodingKeys: String, CodingKey {
    case maxLatitude = "max_lat"
    case maxLongitude = "max_lon"
    case minLatitude = "min_lat"
    case minLongitude = "min_lon"
  }
}
