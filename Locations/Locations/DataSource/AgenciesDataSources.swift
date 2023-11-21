import Foundation

@Sendable
func getAgencies(
  apiURL: URL?,
  jsonLoader: @Sendable @escaping (URL) async throws -> Data,
  jsonDecoder: JSONDecoder
) async throws -> Agencies? {
  guard let apiURL else { return nil }
  let jsonData = try await jsonLoader(apiURL)
  let agencies = try jsonDecoder.decode(Agencies.self, from: jsonData)
  return agencies
}

enum API {
  static let feeds = "https://api-cdn.transitapp.com/v3/feeds/static/full.json"
}
