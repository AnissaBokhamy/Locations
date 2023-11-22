import Foundation

@MainActor
class AgenciesMapViewModel: ObservableObject {

  init(loadAgencies: @Sendable @escaping () async throws -> Agencies?, agencies: [Agency] = []) {
    self.loadAgencies = loadAgencies
    self.agencies = agencies
  }

  let loadAgencies: @Sendable () async throws -> Agencies?

  @Published private(set) var agencies: [Agency] = []

  func loadAgencies() async {
    agencies = try! await loadAgencies()?.agencies ?? []
  }
}
