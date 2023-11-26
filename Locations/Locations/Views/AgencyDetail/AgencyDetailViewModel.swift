import Foundation

struct AgencyDetailViewModel {

  var lastUpdateText: String {
    "Last updated at: \(formattedLastUpdateTimestamp)"
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
