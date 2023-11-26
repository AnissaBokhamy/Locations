import Foundation

struct Agencies: Equatable, Decodable {
  let agencies: [Agency]

  enum CodingKeys: String, CodingKey {
    case agencies = "feeds"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    agencies = try values.decode([Agency].self, forKey: .agencies)
  }
}

struct Agency: Identifiable, Equatable, Decodable {

  // MARK: - Lifecycle

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id = try values.decode(Int.self, forKey: .id)
    name = try values.decode(String.self, forKey: .name)
    city = try? values.decode(String.self, forKey: .city)
    countryCode = try values.decode(Locale.Region.self, forKey: .countryCode)
    subCountryCode = try? values.decode(String.self, forKey: .subCountryCode)
    stars = try values.decode(Stars.self, forKey: .stars)
    lastUpdateTimestamp = try? Self.decodeLastUpdateTimestamp(from: values)
    coordinates = try values.decode(Coordinates.self, forKey: .coordinates)
  }

  init(
    name: String,
    city: String?,
    countryCode: Locale.Region,
    subCountryCode: String?,
    stars: Stars,
    lastUpdateTimestamp: Date?,
    coordinates: Coordinates
  ) {
    id = UUID().hashValue
    self.name = name
    self.city = city
    self.countryCode = countryCode
    self.subCountryCode = subCountryCode
    self.stars = stars
    self.lastUpdateTimestamp = lastUpdateTimestamp
    self.coordinates = coordinates
  }

  // MARK: - Properties

  let id: Int
  let name: String
  let city: String?
  let countryCode: Locale.Region
  let subCountryCode: String?
  let stars: Stars
  let lastUpdateTimestamp: Date?
  let coordinates: Coordinates

  // MARK: - Types

  enum CodingKeys: String, CodingKey {
    case id = "feed_id"
    case name = "feed_name"
    case city = "feed_location"
    case countryCode = "country_codes"
    case subCountryCode = "sub_country_codes"
    case stars = "stars"
    case lastUpdateTimestamp = "bgtfs_uploaded_at"
    case coordinates = "bounds"
  }
}

// MARK: - Agency+DateFormatter

extension Agency {

  // MARK: - Properties

  private static let dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSS'Z'"

  private static let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSS'Z'"
    return dateFormatter
  }()

  // MARK: - Methods

  private static func decodeLastUpdateTimestamp(
    from container: KeyedDecodingContainer<Agency.CodingKeys>
  ) throws -> Date {
    let lastUpdateTimestampString = try container.decode(String.self, forKey: .lastUpdateTimestamp)
    guard let lastUpdateTimestamp = Self.dateFormatter.date(from: lastUpdateTimestampString) else {
      throw DecodingError.dataCorruptedError(
        forKey: Agency.CodingKeys.lastUpdateTimestamp,
        in: container,
        debugDescription: "Unable to find date suiting date format: \(dateFormat)"
      )
    }
    return lastUpdateTimestamp
  }
}
