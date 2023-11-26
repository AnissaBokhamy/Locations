import CoreLocation
import Foundation

struct AgencyDetailViewModel {

  var lastUpdateText: String {
    "Last updated at: \(formattedLastUpdateTimestamp)"
  }

  var moreItemsSection: [MoreItem] {
    [MoreItem(
        name: "Coordinates",
        subItems: [
          MoreSubItem(title: "Min bounds", value: agency.coordinates.minBounds?.format() ?? "unavailable"),
          MoreSubItem(title: "Max bounds", value: agency.coordinates.maxBounds?.format() ?? "unavailable")
        ]
    )]
  }

  var locationText: String {
    let locationElements = [
      agency.city,
      agency.subCountryCode,
      agency.countryCode.identifier
    ]
    return locationElements
      .compactMap { $0 }
      .joined(separator: ", ")
  }

  let agency: Agency

  private var formattedLastUpdateTimestamp: String {
    guard let lastUpdateTimestamp = agency.lastUpdateTimestamp else {
      return "unknown"
    }
    return lastUpdateTimestamp
      .formatted(date: .numeric, time: .standard)
  }
}

// MARK: - More Items
struct MoreItem: Identifiable {
  var id: String {
    name
  }

  let name: String
  let subItems: [MoreSubItem]
}

struct MoreSubItem: Identifiable {
  var id: String {
    title
  }

  let title: String
  let value: String
}

// MARK: - CLLocationCoordinate2D+Formatter
private extension CLLocationCoordinate2D {
  func format() -> String {
    "(\(latitude), \(longitude))"
  }
}
