import Foundation

let loadAgencies: @Sendable () async throws -> Agencies? = {
  let apiURL = URL(string: API.feeds)

  let jsonLoader: @Sendable (URL) async throws -> Data = { url in
    try await loadJSON(from: url)
  }

  let jsonDecoder = JSONDecoder()

  return try await getAgencies(
    apiURL: apiURL,
    jsonLoader: jsonLoader,
    jsonDecoder: jsonDecoder
  )
}
