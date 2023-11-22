import Foundation

@Sendable
func loadJSON(from url: URL) async throws -> Data {
  let urlSession = URLSession.shared

  do {
    let (data, _) = try await urlSession.data(from: url)
    return data
  } catch {
    throw JSONLoaderError()
  }
}

struct JSONLoaderError: Error {

  var description: String {
    "Unable to retrieve data from the request data"
  }
}
